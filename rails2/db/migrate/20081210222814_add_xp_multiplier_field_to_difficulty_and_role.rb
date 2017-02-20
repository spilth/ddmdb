class AddXpMultiplierFieldToDifficultyAndRole < ActiveRecord::Migration
  def self.up
    add_column :difficulties, :xp_multiplier, :float, :default => 1.0
    add_column :roles, :xp_multiplier, :float, :default => 1.0
  end

  def self.down
    remove_column :difficulties, :xp_multiplier
    remove_column :roles, :xp_multiplier
  end
end
