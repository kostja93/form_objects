require 'rails_helper'

RSpec.describe EmployeeCreditRequest, type: :model do
  let(:valid_params) do
    {
      first_name: 'Jon',
      last_name: 'Doe',
      street_name: 'Wall Street',
      house_number: '12',
      post_code: 'NY-4567',
      city: 'New York',
      birthday: '2000-01-01',
      value: '1000.00',
      currency: 'USD',
    }
  end

  it 'creates a user and a credit_request for the user' do
    result = described_class.new(valid_params).save
    expect(result).to be_kind_of(CreditRequest)
  end
end
