class Cat < ActiveRecord::Base
  attr_accessible :birthday, :breed, :description, :name
  
  has_many :cat_members
  has_many :members, through: :cat_members
  has_many :catbribes
end
