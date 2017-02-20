class AddPathToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :path, :string
  end

  def self.down
    remove_column :releases, :path
  end
end
