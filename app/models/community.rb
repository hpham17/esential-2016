class Community < ActiveRecord::Base
  has_one :address
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
end
