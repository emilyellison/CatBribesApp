class AddCatIdToCatbribes < ActiveRecord::Migration
  def change
    add_column :catbribes, :cat_id, :integer
  end
end
