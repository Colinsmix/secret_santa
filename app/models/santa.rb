class Santa < ActiveRecord::Base
  belongs_to :user
  has_many :participants

  accepts_nested_attributes_for :participants, allow_destroy: true

  state_machine :state, :initial => :editable do
    event :lock do
      transition :editable => :locked
    end

    event :notify do
      transition :locked => :notified
    end
  end

  def get_matches
    group = self.participants.map{|x| x.id}.shuffle
    giver = group.last
    matches = []
    group.each do |member|
      matches << giver
      matches << member
      giver = member
    end
    matches
  end

  def show_matches
    self.match.map{|x| Participant.find(x).name}.each_slice(2).to_a
  end
end
