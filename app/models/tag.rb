class Tag < ActiveRecord::Base
has_many :groups, :through => :tag_groups
has_many :tag_groups , dependent: :destroy

end
