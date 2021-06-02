class LandingController < ApplicationController

  def index
    @showtimes = Showtime.all.sort_by(&:start_time).group_by{ |showtime| showtime.start_time.to_date}.transform_values do |shows|
      shows.group_by{ |showtime| showtime.movie.title }
    end
  end

  def admin
    @showtime_count = Showtime.all.length
    @movie_count = Movie.all.length
    @auditorium_count = Auditorium.all.length
    @receipts_count = Receipt.all.length
  end
end