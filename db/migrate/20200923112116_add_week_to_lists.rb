class AddWeekToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :stu_week, :string
    add_column :lists, :stu_time, :string
  end
end
