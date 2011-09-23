class AddProcessingToLooks < ActiveRecord::Migration
  def change
    add_column :looks, :processing, :boolean
  end
end
