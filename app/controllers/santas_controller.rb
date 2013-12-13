class SantasController < ApplicationController
  before_filter :authenticate_user!

  def new
    @santa = Santa.new
  end

  def create
    @santa = Santa.new(santa_params)
    @santa.user = current_user
    if @santa.save
      redirect_to santas_path, notice: 'Secret Santa is a go'
    else
      render 'new'
    end
  end

  def index
    @santas = Santa.where(user_id: current_user.id)
  end

  def show
    @santa = Santa.find(params[:id])
  end

  def edit
    @santa = Santa.find(params[:id])
  end

  def match
    @santa = Santa.find(params[:id])
    @santa.lock
    @santa.match = @santa.get_matches
    @santa.save!
    redirect_to santa_path(@santa), notice: 'Matches Made!!'
  end

  def email
    @santa = Santa.find(params[:id])
    @santa.get_matches.each_slice(2).to_a.each do |pair|
      SantaMailer.secret_santa_email(Participant.find(pair[0]), Participant.find(pair[1])).deliver
    end
    @santa.notify
    redirect_to santa_path(@santa), notice: 'You Secret Santa participants have been notified!'
  end

  def update
    @santa = Santa.find(params[:id])
    if @santa.update_attributes(santa_params)
      redirect_to santa_path(@santa), notice: 'Successfully updated Santa'
    else
      render 'edit'
    end
  end

  private
  def santa_params
    params.require(:santa).permit(:name, :match,  participants_attributes: [:id, :name, :number, :email, :_destroy])
  end
end
