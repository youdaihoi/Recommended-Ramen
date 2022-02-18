class ChangeDatatypeParkingLotOfRamen < ActiveRecord::Migration[5.2]
  def change
    change_column :ramen, :parking_lot, :integer
  end
end
