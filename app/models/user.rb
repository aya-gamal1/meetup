class User < ActiveRecord::Base






  attr_accessor :password,  :email, :name, :gender, :age, :city, :country, :avatar 



validates :name, :password, :email, :gender, :age, :avatar, :country, :city , presence: true
  validates :password, length: { in: 6..20 }
  validates :email, length: { minimum: 6 } ,uniqueness: true
  validates :age, numericality: { only_integer: true }


def self.authenticate(email, password)
    user = find_by_email(email)
    user.password = find_by_password(password)
    if user && user.password
      user
    else
      nil
    end
  end




has_many :events, :through => :eventadmins
	has_many :eventadmins
	has_many :comments
	has_many :groups
end
