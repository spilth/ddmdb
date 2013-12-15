class CreateRarities < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
