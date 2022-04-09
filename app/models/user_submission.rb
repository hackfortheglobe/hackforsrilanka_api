class UserSubmission < ApplicationRecord
  belongs_to :station

  enum gas_type: [:petrol_93, :diesel, :petrol_95, :gas_cylinder, :super_diesel]
  enum availability: [:available, :unavailable, :unsure]
end
