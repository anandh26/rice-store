class User < ActiveRecord::Base
  before_create :generate_confirmhash
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  ,:allow_blank => true
  validates :email, :presence => { :message => ' Email cannot be blank'}

  def generate_confirmhash
    self.token =  SecureRandom.urlsafe_base64(nil,false)
  end
end
