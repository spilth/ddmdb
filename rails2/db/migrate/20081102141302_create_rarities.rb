class CreateRarities < ActiveRecord::Migration
  def self.up
    create_table :rarities do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end

  def self.down
    drop_table :rarities
  end
end
