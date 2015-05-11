class User < ActiveRecord::Base



  #attr_accessor :password,  :email, :name, :gender, :age, :city, :country, :avatar 
  
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  

  validates :name, :password, :email, :gender, :age, :avatar, :country, :city , presence: true
  validates :password, length: { in: 6..20 }
  validates :email, length: { minimum: 6 } ,uniqueness: true
  validates :age, numericality: { only_integer: true }
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



def self.authenticate(email, password)
    user = find_by_email(email)
    userPassword = find_by_password(password)
    if user && userPassword
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
