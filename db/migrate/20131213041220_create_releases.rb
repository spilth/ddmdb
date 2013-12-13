class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.string :abbreviation
      t.integer :count

      t.timestamps
    end
  end
end
