class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
	  t.integer :tasktop_id

      t.timestamps
    end
  end
end
