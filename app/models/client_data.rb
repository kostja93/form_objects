class ClientData
  include ActiveModel::Model

  attr_accessor :id, :street_name, :house_number, :post_code, :city, :birthday

  validates :id, presence: true
  validates :street_name, presence: true
  validates :house_number, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validate :is_18_years_old

  def save
    return false unless valid?
    return false unless @client = Client.find(id)
    @client.update(attributes)
  end

  def attributes
    {
      street_name: street_name,
      house_number: house_number,
      post_code: post_code,
      city: city,
      birthday: birthday,
    }
  end

  private

  def is_18_years_old
    return true if (Time.now - Time.parse(birthday)) >= 18.years
    errors.add(:birthday, 'You have to be 18 years old to get a credit')
  end
end
