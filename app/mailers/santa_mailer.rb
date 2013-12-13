class SantaMailer < ActionMailer::Base
  default from: "santa@secretsanta.com"
  
  def secret_santa_email(participant, match)
    @participant = participant
    @match = match
    mail(to: @participant.email, subject: 'Your Secret Santa')
  end
end
