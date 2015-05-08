class ChangeGroup < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
  		
  		t.string :avatar
  	end
  end
end
