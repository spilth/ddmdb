class AddRarityToMiniature < ActiveRecord::Migration
  def change
    add_reference :miniatures, :rarity, index: true
  end
end
