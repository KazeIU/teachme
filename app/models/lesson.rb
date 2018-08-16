class Lesson < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_location_and_language,
    against: [ :location, :language ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  belongs_to :user
  has_many :appointments
  validates :language, inclusion: { in: ["English", "Japanese", "French"]}
  validates :level, inclusion: { in: ["Novice", "Conversational", "Business", "Fluent"]}
  validates :price, presence: true, numericality: { only_integer: true }
  validates :duration, inclusion: {in: [40, 60, 90]}
end
