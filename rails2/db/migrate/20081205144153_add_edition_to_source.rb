class AddEditionToSource < ActiveRecord::Migration
  def self.up
    add_column :sources, :edition, :integer, :default => 3, :null => false
  end

  def self.down
    remove_column :sources, :edition
  end
end
