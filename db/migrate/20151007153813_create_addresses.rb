class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :city, index: true, foreign_key: true
      t.string :zip
      t.string :raw_line
    end
  end
end
