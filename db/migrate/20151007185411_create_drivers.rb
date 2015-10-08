class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.date :schedule
      t.belongs_to :truck, index: true, foreign_key: true
    end
  end
end
