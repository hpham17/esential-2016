class Community < ActiveRecord::Base
  has_one :address
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
  def as_json(options={})
    { :name => self.name, :address => self.address.format  }
  end
end
