class AddMemberIdToCatbribes < ActiveRecord::Migration
  def change
    add_column :catbribes, :member_id, :integer
  end
end
