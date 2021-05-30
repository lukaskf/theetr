json.extract! receipt, :id, :purchased_at, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
