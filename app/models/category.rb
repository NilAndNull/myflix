# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :videos, -> { order("title") }

  validates :name, presence: true

  def recent_videos
    Video.limit(6).order(updated_at: :desc).where(category_id: self.id)
  end

end
