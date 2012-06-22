class CatMember < ActiveRecord::Base
  attr_accessible :cat_id, :member_id
  
  belongs_to :cat
  belongs_to :member
  
  def self.authorized_cats_for(current_member_id)
    find_all_by_member_id(current_member_id).collect { |x| [ Cat.find(x.cat_id).name, Cat.find(x.cat_id).id ] }
  end
end
