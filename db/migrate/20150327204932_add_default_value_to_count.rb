class AddDefaultValueToCount < ActiveRecord::Migration
  def change
    change_column :urls, :count, :integer, default: 1
  end
end
