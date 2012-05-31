class CreateCatbribes < ActiveRecord::Migration
  def change
    create_table :catbribes do |t|
      t.string :image
      t.text :caption
      t.integer :member_id

      t.timestamps
    end
  end
end
