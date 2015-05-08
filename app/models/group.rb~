class Group < ActiveRecord::Base
  belongs_to :user
has_many :events ,dependent: :destroy

validates :topicname, presence: true
validates :description, presence: true
end
