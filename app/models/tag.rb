class Tag < ActiveRecord::Base
has_many :groups, :through => :taggroups
has_many :taggroups

end
