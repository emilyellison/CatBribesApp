class Cat < ActiveRecord::Base
  attr_accessible :birthday, :breed, :description, :name
  
  has_many :cat_members
  has_many :members, through: :cat_members
  has_many :catbribes
  
  def email(cat_id)
    Member.find_by_id(CatMember.find_by_id(cat_id).member_id).email
  end
end
