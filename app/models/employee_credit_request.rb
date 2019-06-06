class EmployeeCreditRequest
  include ActiveModel::Model

  attr_accessor(
    :first_name,
    :last_name,
    :street_name,
    :house_number,
    :post_code,
    :city,
    :birthday,
    :value,
    :currency,
  )

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street_name, presence: true
  validates :house_number, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :birthday, presence: true
  validates :value, presence: true
  validates :currency, presence: true

  def save
    return false unless valid?

    client = create_client(attributes.slice(
      :first_name, :last_name, :street_name, :house_number,
      :post_code, :city, :birthday
    ))
    create_credit_request(attributes.slice(
      :value, :currency
    ).merge(client: client))
  end

  def attributes
    {
      first_name: first_name,
      last_name: last_name,
      street_name: street_name,
      house_number: house_number,
      post_code: post_code,
      city: city,
      birthday: birthday,
      value: value,
      currency: currency,
    }
  end

  private

  def create_client(client_params)
    Client.create(client_params)
  end

  def create_credit_request(credit_request_params)
    CreditRequest.create(credit_request_params)
  end
end
