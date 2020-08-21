class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :subject
      t.string :content

      t.timestamps
    end
  end
end
