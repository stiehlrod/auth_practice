class User < ApplicationRecord
  validates_presence_of :full_name
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

    # e.g., User.authenticate('penelope@turing.com', 'boom')
  def authenticate(password)
    self.password == password
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end

end
