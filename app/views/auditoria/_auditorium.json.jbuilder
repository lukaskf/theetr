json.extract! auditorium, :id, :name, :seat_capacity, :created_at, :updated_at
json.url auditorium_url(auditorium, format: :json)
