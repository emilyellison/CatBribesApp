class Rating < ActiveRecord::Base
  attr_accessible :bribes, :catbribe_id, :member_id
  
  belongs_to :member
  belongs_to :catbribe
  
end
