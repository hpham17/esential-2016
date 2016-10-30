class Community < ActiveRecord::Base
  has_one :address
  belongs_to :user
end
