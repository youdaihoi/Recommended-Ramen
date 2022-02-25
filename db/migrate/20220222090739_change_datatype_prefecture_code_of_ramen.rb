# frozen_string_literal: true

class ChangeDatatypePrefectureCodeOfRamen < ActiveRecord::Migration[5.2]
  def change
    change_column :ramen, :prefecture_code, :integer
  end
end
