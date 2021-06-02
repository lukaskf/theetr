json.extract! receipt, :id, :purchased_at, :credit_card_number, :credit_card_expiration, :customer_name, :customer_email, :showtime_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
