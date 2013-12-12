class Participant < ActiveRecord::Base
  belongs_to :santa
  validate :email_or_phone

  private
  def email_or_phone
    if !(email.blank? || number.blank?)
      errors[:base] << "Specify an email or a phone number"
    end
  end
end
