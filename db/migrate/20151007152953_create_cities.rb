class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :state, index: true, foreign_key: true
    end
  end
end
