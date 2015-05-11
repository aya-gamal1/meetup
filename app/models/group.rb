class Group < ActiveRecord::Base
  belongs_to :user
has_many :events ,dependent: :destroy
has_many :group_memebers , dependent: :destroy
has_many :tag_groups , dependent: :destroy

validates :topicname, presence: true
validates :description, presence: true

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  geocoded_by :location  # can also be an IP address
after_validation :geocode          # auto-fetch coordinates

end
