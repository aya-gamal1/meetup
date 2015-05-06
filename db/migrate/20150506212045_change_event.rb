class ChangeEvent < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		
  		t.references :group, index: true
  	end
  
  add_foreign_key :events, :groups
  end
end
