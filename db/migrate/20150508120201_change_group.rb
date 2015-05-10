class ChangeGroup < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
  		
  		t.string :avatar
  		t.float :longitude
  		t.float :latitude
  	end
  end
end
