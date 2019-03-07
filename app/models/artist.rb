# == Schema Information
#
# Table name: artists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :records, dependent: :destroy
end
