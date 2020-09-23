class AddWeekToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :week, :string
  end
end
