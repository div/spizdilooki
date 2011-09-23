class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :text
      t.integer :look_id

      t.timestamps
    end
  end
end
