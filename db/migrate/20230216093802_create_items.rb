class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, null: false, foreign_key: true
      t.string :name
      t.integer :introduction
      t.integer :price
      t.boolean :sales_status

      t.timestamps
    end
  end
end
