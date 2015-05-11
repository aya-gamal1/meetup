class ChangeGroup < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
  		
  		t.string :location
  		
  	end
  end
end
