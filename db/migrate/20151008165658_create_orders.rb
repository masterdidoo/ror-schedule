class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.date :delivery_date
      t.integer :delivery_shift
      t.float :volume
      t.integer :handling_unit_quantity
      
      t.string :origin_name
      t.belongs_to :origin_address, class_name: 'Address', index: true, foreign_key: true

      t.string :destination_name
      t.belongs_to :destination_address, class_name: 'Address', index: true, foreign_key: true

      t.string :phone_number

      t.timestamps null: false
    end
  end
end
