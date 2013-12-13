class SantaMailer < ActionMailer::Base
  default from: "santa@secretsanta.com"
  
  def secret_santa_email(participant, match, santa)
    @participant = participant
    @match = match
    @santa = santa
    mail(to: @participant.email, subject: 'Your Secret Santa')
  end
end
