class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :bribes
      t.integer :member_id
      t.integer :catbribe_id

      t.timestamps
    end
  end
end
