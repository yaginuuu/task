class CreateTasktops < ActiveRecord::Migration
  def change
    create_table :tasktops do |t|
      t.string :name
      t.integer :weight
      t.string :owner

      t.timestamps
    end
  end
end
