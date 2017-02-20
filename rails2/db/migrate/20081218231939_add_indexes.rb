class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :miniatures, :id
    add_index :releases, :id
    add_index :types, :id
    add_index :subtypes, :id
    add_index :sizes, :id
    add_index :rarities, :id
    add_index :settings, :id
    add_index :sources, :id

    add_index :difficulties, :id
    add_index :keywords, :id
    add_index :kinds, :id
    add_index :origins, :id
    add_index :roles, :id
    add_index :users, :id

  end

  def self.down
    remove_index :miniatures, :id
    remove_index :releases, :id
    remove_index :types, :id
    remove_index :subtypes, :id
    remove_index :sizes, :id
    remove_index :rarities, :id
    remove_index :settings, :id
    remove_index :sources, :id

    remove_index :difficulties, :id
    remove_index :keywords, :id
    remove_index :kinds, :id
    remove_index :origins, :id
    remove_index :roles, :id
    remove_index :users, :id

  end
end
