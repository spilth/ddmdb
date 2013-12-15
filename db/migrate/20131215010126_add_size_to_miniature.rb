class AddSizeToMiniature < ActiveRecord::Migration
  def change
    add_reference :miniatures, :size, index: true
  end
end
