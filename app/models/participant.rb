class Participant < ActiveRecord::Base
  belongs_to :santa
  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
end
