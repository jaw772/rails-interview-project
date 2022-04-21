require 'rails_helper'

RSpec.describe 'Landing Page' do
  it "displays the total number of users, questions, answers and requests" do
    visit '/'

    expect(page).to have_content('Total Number of Users:')
    expect(page).to have_content('Total Number of Questions:')
    expect(page).to have_content('Total Number of Answers:')
    expect(page).to have_content('Total Number of Requests Made by Tenants:')
  end

  it 'returns an increased value for tenant requests after a request is made' do
    visit '/'
    expect(page).to have_content('Total Number of Requests Made by Tenants: 0')

    Tenant.first.update_attribute(:request_counter, 1)

    visit '/'
    expect(page).to have_content('Total Number of Requests Made by Tenants: 1')
  end
end
