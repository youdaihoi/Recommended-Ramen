class AddColumnsToRamen < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen, :postal_code, :integer
    add_column :ramen, :prefecture_code, :string
    add_column :ramen, :city, :string
    add_column :ramen, :street, :string
  end
end
