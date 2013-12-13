class AddReleaseToMiniature < ActiveRecord::Migration
  def change
    add_reference :miniatures, :release, index: true
  end
end
