class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.text :description
      t.string :title
      t.string :avatar
      t.date :date
      t.time :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
