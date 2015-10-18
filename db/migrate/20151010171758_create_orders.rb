class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.date :delivery_date
      t.integer :delivery_shift, default: 0, null: false
      t.float :volume
      t.integer :handling_unit_quantity

      t.string :origin_name
      t.string :origin_phone
      t.belongs_to :origin_address, class_name: 'Address', index: true, foreign_key: true

      t.string :destination_name
      t.string :destination_phone
      t.belongs_to :destination_address, class_name: 'Address', index: true, foreign_key: true

      t.belongs_to :load_step, class_name: 'RoutingStep', index: true, foreign_key: true
      t.belongs_to :unload_step, class_name: 'RoutingStep', index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
