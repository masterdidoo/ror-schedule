class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :schedule
      t.belongs_to :truck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
