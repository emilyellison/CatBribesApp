class Cat < ActiveRecord::Base
  attr_accessible :birthday, :breed, :description, :name, :member_id
  
  belongs_to :member
  has_many :catbribes
end
