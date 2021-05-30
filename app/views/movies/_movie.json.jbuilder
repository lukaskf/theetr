json.extract! movie, :id, :title, :duration, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)
