class CreateRoutingSteps < ActiveRecord::Migration
  def change
    create_table :routing_steps do |t|
      t.integer :index
      t.datetime :delivery_time
      # t.belongs_to :next_step, class_name: 'RoutingStep', index: true, foreign_key: true
      t.belongs_to :routing_list, index: true, foreign_key: true, :dependent => :destroy

      t.timestamps null: false
    end
  end
end
