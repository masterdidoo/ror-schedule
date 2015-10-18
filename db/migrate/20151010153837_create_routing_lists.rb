class CreateRoutingLists < ActiveRecord::Migration
  def change
    create_table :routing_lists do |t|
      t.date :delivery_date
      t.integer :delivery_shift, default: 0, null: false
      t.belongs_to :driver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
