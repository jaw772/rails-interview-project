require 'rails_helper'

RSpec.describe Tenant do
  describe '#total_requests' do
    it 'returns the total number of requests made by tenants' do
      total = Tenant.total_requests
      expect(total).to eq 0
    end

    it 'returns an increaded value after requests are made' do
      tenant_1 = Tenant.first
      tenant_2 = Tenant.last
      total = Tenant.total_requests
      expect(total).to eq 0
      tenant_1.update_attribute(:request_counter, 2)
      tenant_2.update_attribute(:request_counter, 5)
      total = Tenant.total_requests
      expect(total).to eq 7
    end
  end

end
