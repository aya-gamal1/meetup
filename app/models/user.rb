class User < ActiveRecord::Base
	has_many :events, :through => :eventadmins
	has_many :eventadmins
	has_many :comments
	has_many :groups
end
