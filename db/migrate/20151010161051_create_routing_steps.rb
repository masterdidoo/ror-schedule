class CreateRoutingSteps < ActiveRecord::Migration
  def change
    create_table :routing_steps do |t|
      t.time :delivery_time
      t.belongs_to :next_step, class_name: 'RoutingStep', index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
