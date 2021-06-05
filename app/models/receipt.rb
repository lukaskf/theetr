class Receipt < ApplicationRecord
  belongs_to :showtime

  validates :customer_name, presence: true
  validates :customer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :credit_card_number, presence: true
  validates :credit_card_expiration, presence: true

  validate :card_number

  def card_number
    unless CreditCardValidator::Validator.valid?(self.credit_card_number)
      errors.add(:credit_card_number, "is not valid.")
    end
  end

end
