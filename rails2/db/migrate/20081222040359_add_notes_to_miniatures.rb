class AddNotesToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :notes, :text
  end

  def self.down
    remove_column :miniatures, :notes
  end
end
