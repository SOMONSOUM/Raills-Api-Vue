class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :records, dependent: :destroy
end
