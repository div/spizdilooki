class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.string :name
      t.string :city
      t.string :age
      t.integer :lookatmeid
      t.string :dateadded

      t.timestamps
    end
  end
end
