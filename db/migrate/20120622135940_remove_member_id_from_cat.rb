class RemoveMemberIdFromCat < ActiveRecord::Migration
  def up
    remove_column :cats, :member_id
      end

  def down
    add_column :cats, :member_id, :integer
  end
end
