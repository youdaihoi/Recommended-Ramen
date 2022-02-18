class RemoveIntegerFromRamen < ActiveRecord::Migration[5.2]
  def change
    remove_column :ramen, :integer, :string
  end
end
