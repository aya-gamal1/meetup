class TagGroup < ActiveRecord::Base
  belongs_to :tag
  belongs_to :group
end
