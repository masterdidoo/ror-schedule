class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :raw_line
      t.belongs_to :city, index: true, foreign_key: true
    end
  end
end
