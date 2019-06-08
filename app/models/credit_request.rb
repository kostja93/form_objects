class CreditRequest < ApplicationRecord
  validates :value, presence: true
  validates :currency, presence: true
  belongs_to :client
end
