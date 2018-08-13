class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  validates :start_time, presence: true
end
