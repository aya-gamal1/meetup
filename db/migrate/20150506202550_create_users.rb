class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :gender
      t.integer :age
      t.string :city
      t.string :country
      t.string :avatar
      t.string :isadmin

      t.timestamps null: false
    end
  end
end
