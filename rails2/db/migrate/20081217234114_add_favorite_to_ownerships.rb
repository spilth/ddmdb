class AddFavoriteToOwnerships < ActiveRecord::Migration
  def self.up
      add_column :ownerships, :favorite, :boolean, :default => false, :null => false
    end

    def self.down
      remove_column :ownerships, :favorite
  end
end
