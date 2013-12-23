class AddLevelAndLeaderToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :level, :integer
    add_column :miniatures, :leader, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :miniatures, :level
    remove_column :miniatures, :leader
  end

end
