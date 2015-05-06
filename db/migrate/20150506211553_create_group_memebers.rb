class CreateGroupMemebers < ActiveRecord::Migration
  def change
    create_table :group_memebers do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
