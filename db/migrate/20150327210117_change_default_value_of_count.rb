class ChangeDefaultValueOfCount < ActiveRecord::Migration
  def change
    change_column :urls, :count, :integer, default: 0
  end
end
