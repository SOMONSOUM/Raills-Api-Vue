# == Schema Information
#
# Table name: records
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  user_id    :integer
#

class Record < ApplicationRecord
  belongs_to :user

  validates :title, :year, presence: true
end
