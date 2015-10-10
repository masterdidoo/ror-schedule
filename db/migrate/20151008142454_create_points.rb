class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :name
      t.string :phone
      t.belongs_to :address

      t.timestamps null: false
    end
  end
end
