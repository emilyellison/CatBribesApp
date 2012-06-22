class CatMember < ActiveRecord::Base
  attr_accessible :cat_id, :member_id
  
  belongs_to :cat
  belongs_to :member
  
  def self.authorized_cats_for(current_member_id)
    find_all_by_member_id(current_member_id).collect { |x| [ Cat.find(x.cat_id).name, Cat.find(x.cat_id).id ] }
  end
  
  def nonauthorized_members_for(cat_id)
    pre_nonauth = []
    Member.all.each do |member|
      pre_nonauth << member.email
    end
    CatMember.find_all_by_cat_id(cat_id).each do |catmember|
      pre_nonauth.delete_if {|a| a == Member.find(catmember.member_id).email }
    end
    nonauth = []
    pre_nonauth.each do |p|
      nonauth << [ Member.find_by_email(p).full_name, Member.find_by_email(p).id ]
    end
    nonauth
  end
end
