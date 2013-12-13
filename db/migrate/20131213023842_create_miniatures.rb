class CreateMiniatures < ActiveRecord::Migration
  def change
    create_table :miniatures do |t|
      t.string :name
      t.references :type, index: true
      t.references :subtype, index: true

      t.timestamps
    end
  end
end
