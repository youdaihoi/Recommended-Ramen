# frozen_string_literal: true

class CreateRamen < ActiveRecord::Migration[5.2]
  def change
    create_table :ramen do |t|
      t.text :shop_name
      t.string :image_id
      t.text :address
      t.integer :category
      t.integer :user_id
      t.string :parking_lot
      t.string :integer

      t.timestamps
    end
  end
end
