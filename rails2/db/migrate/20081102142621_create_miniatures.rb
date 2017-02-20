class CreateMiniatures < ActiveRecord::Migration
  def self.up
    create_table :miniatures do |t|
      t.string :name
      t.integer :number
      t.integer :release_id
      t.integer :type_id
      t.integer :subtype_id
      t.integer :source_id
      t.integer :source_page_number
      t.integer :setting_id
      t.float :challenge_rating

      t.timestamps
    end
  end

  def self.down
    drop_table :miniatures
  end
end
