class RemoveMemberIdFromCatbribes < ActiveRecord::Migration
  def change
    remove_column :catbribes, :member_id
  end
end
