class Event < ActiveRecord::Base

  has_many :user, :through => :eventadmins
  has_many :eventadmins
  has_many :comments
  belongs_to :group
end
