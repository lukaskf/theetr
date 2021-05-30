json.extract! showtime, :id, :start_time, :end_time, :seats_purchased, :movie_id, :auditorium_id, :created_at, :updated_at
json.url showtime_url(showtime, format: :json)
