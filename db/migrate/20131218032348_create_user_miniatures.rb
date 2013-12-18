class CreateUserMiniatures < ActiveRecord::Migration
  def change
    create_table :user_miniatures do |t|
      t.references :user, index: true
      t.references :miniature, index: true
      t.integer :count

      t.timestamps
    end
  end
end
