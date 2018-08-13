class Lesson < ApplicationRecord
  belongs_to :user
  validates :language, inclusion: { in: ["English", "Japanese", "French"]}
  validates :level, inclusion: { in: ["Novice", "Conversational", "Business", "Fluent"]}
  validates :price, presence: true, numericality: { only_integer: true }
  validates :duration, inclusion: {in: [40, 60, 90]}
end
