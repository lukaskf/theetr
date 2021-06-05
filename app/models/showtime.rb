class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium

  has_many :receipts

  def seat_purchased!
    unless self.seats_full?
      self.seats_purchased += 1
      self.save!
    end
  end

  def seats_full?
    if self.seats_purchased == self.auditorium.seat_capacity
      true
    else
      false
    end
  end
end
