require 'securerandom'

class PowercutSchedule < ApplicationRecord
  before_save :add_unique_id

  def add_unique_id
    self.unique_id = SecureRandom.uuid
  end
end
