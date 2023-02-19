class Fix01 < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :introduction, :text
  end
end
