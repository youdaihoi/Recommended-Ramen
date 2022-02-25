# frozen_string_literal: true

class RemoveCategoryFromRamen < ActiveRecord::Migration[5.2]
  def change
    remove_column :ramen, :category, :integer
  end
end
