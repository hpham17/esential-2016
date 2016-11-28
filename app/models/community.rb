class Community < ActiveRecord::Base
  has_one :address
  belongs_to :user
  has_many :images
  has_many :loan_requests
  accepts_nested_attributes_for :images, :address,
    :reject_if => :all_blank
  validates :name, :description, :number, :total_loan_amount, :max_loan_amount, :interest_rate, :loan_period, presence: true
  validates :name, uniqueness: true
  validates :number, :total_loan_amount, :max_loan_amount, :interest_rate, :loan_period, numericality: { only_integer: true }

  # Custom JSON format
  def as_json(options={})
    { :name => self.name, :address => self.address.format, :zipcode => self.address.zip }
  end

  def self.find_address(address)
    @community = Community.all.reject { |c| c.address.format != address}
  end

  def must_have_address
    errors.add(:address, 'must have address') if self.address.nil?
  end
end
