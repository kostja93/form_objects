class ClientName
  include ActiveModel::Model

  attr_accessor :first_name, :last_name

  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 2 }

  def save
    return false unless valid?

    Client.create(first_name: first_name, last_name: last_name)
  end

  def attributes
    {
      first_name: first_name,
      last_name: last_name,
    }
  end
end
