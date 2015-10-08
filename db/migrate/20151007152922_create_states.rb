class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.belongs_to :country, index: true, foreign_key: true
    end
  end
end
