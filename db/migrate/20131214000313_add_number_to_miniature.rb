class AddNumberToMiniature < ActiveRecord::Migration
  def change
    add_column :miniatures, :number, :integer
  end
end
