json.extract! user, :id, :name, :password, :role, :email, :credit_card_number, :credit_card_expiration, :created_at, :updated_at
json.url user_url(user, format: :json)
