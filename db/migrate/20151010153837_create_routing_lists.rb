class CreateRoutingLists < ActiveRecord::Migration
  def change
    create_table :routing_lists do |t|
      t.date :delivery_date
      t.integer :delivery_shift
      t.belongs_to :driver, index: true, foreign_key: true
      t.belongs_to :first_step, class_name: 'RoutingStep', index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
