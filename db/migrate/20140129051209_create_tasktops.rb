class CreateTasktops < ActiveRecord::Migration
  def change
    create_table :tasktops do |t|
      t.string :name
      t.integer :weight
      t.string :owner
	  t.integer :group_id

      t.timestamps
    end
  end
end
