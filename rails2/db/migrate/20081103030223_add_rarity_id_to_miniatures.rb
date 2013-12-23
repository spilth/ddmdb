class AddRarityIdToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :rarity_id, :integer
  end

  def self.down
    remove_column :miniatures, :rarity_id
  end
end
