class Community < ActiveRecord::Base
  has_one :address
  belongs_to :user
  has_many :images
  has_many :loan_requests
  accepts_nested_attributes_for :images
  def as_json(options={})
    { :name => self.name, :address => self.address.format, :zipcode => self.address.zip }
  end
  # def myfunc(communities)
  #   array = []
  #   communities.each do |t|
  #     array << t.values
  #   end
  #   array.flatten!
  #   narray = Array.new(array.count)
  #   array = array.zip(narray)
  #   array = array.to_h
  # end
  def self.find_address(address)
    @community = Community.all.reject { |c| c.address.format != address}
  end

end
