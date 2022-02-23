class AddCategoryIdToRamen < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen, :category_id, :integer
  end
end
