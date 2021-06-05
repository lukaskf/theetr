namespace :db do

  desc 'Populates DB with example data'
  task populate: :environment do
    auditoriums =
      [
        {
        :name => 'Madison Square Garden',
        :seat_capacity => 4
        },
        {
          :name => 'First Ave',
          :seat_capacity => 2
        },
        {
          :name => 'Rockefeller',
          :seat_capacity => 1
        }
      ]
    movies =
      [
        {
          :title => 'Batman & Robin',
          :rating => 'PG-13',
          :duration => 90
        },
        {
          :title => 'Pulp Fiction',
          :rating => 'R',
          :duration => 120
        },
        {
          :title => 'Moana',
          :rating => 'PG',
          :duration => 90
        }
      ]

    auditoriums.each do |auditorium|
      a = Auditorium.new auditorium
      a.save!
    end

    movies.each do |movie|
      m = Movie.new movie
      m.save!
    end

    (1..3).each do |day|
      Movie.all.each do |movie|
        Auditorium.all.each do |auditorium|
          s = Showtime.new
          s.auditorium = auditorium
          s.movie = movie
          s.price = day + 5
          s.start_time = Time.now + day.days + s.auditorium.seat_capacity.hours
          s.end_time = s.start_time + s.movie.duration.minutes
          s.save!
        end
      end
    end
  end
end