class CreateCatMembers < ActiveRecord::Migration
  def change
    create_table :cat_members do |t|
      t.integer :cat_id
      t.integer :member_id

      t.timestamps
    end
  end
end
