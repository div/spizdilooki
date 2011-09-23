class AddImageToLooks < ActiveRecord::Migration
  def change
    add_column :looks, :image, :string
  end
end
