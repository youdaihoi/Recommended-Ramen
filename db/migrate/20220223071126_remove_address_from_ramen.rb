# frozen_string_literal: true

class RemoveAddressFromRamen < ActiveRecord::Migration[5.2]
  def change
    remove_column :ramen, :address, :text
  end
end
