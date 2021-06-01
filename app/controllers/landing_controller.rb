class LandingController < ApplicationController

  def index
    @showtimes = Showtime.all.sort_by(&:start_time).group_by{ |showtime| showtime.start_time.to_date}.transform_values do |shows|
      shows.group_by{ |showtime| showtime.movie.title }
    end

    Rails.logger.info @showtimes
  end

end