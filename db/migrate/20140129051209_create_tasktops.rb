class CreateTasktops < ActiveRecord::Migration
  def change
    create_table :tasktops do |t|
      t.string :name
      t.integer :weight
	    t.integer :user_id
			t.integer :group_id	
			t.integer :finish

      t.timestamps
    end
  end
end
