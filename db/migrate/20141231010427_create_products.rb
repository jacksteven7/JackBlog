class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id
      t.string :title
      t.integer :price
      t.text :description
      t.string :category
      t.boolean :avaliable

      t.timestamps
    end
  end
end
