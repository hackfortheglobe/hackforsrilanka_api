class Station < ApplicationRecord
  has_many :user_submissions, inverse_of: :station

  reverse_geocoded_by :latitude, :longitude
end
