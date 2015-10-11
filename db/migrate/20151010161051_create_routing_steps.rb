class CreateRoutingSteps < ActiveRecord::Migration
  def change
    create_table :routing_steps do |t|
      # t.integer :order_index
      t.datetime :delivery_time
      t.belongs_to :next_step, class_name: 'RoutingStep', index: true, foreign_key: true
      # t.belongs_to :routing_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
