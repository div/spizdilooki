class AddSourceImageUrlToLooks < ActiveRecord::Migration
  def change
    add_column :looks, :source_img_url, :string
  end
end
