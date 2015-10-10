class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :number
      t.float :volume
      t.belongs_to :start_address, name: :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
