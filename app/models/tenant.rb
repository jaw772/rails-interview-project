class Tenant < ActiveRecord::Base

  before_create :generate_api_key, :set_counter

  def self.total_requests
    Tenant.sum(:request_counter)
  end

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

  def set_counter
    self.request_counter = 0
  end
end
