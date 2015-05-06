class Event < ActiveRecord::Base
  belongs_to :user, :through => :eventadmins
  has_many :eventadmins
  has_many :comments
  belongs_to :group
end
