class Event < ActiveRecord::Base

  has_many :user, :through => :eventadmins
  has_many :event_admins , dependent: :destroy
  has_many :comments ,dependent: :destroy
  belongs_to :group

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

validates :location, presence: true
validates :description, presence: true
validates :title, presence: true
validates :avatar, presence: true
validates :date, presence: true
validates :time, presence: true
end
