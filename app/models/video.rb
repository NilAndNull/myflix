# == Schema Information
#
# Table name: videos
#
#  id               :integer          not null, primary key
#  uuid             :string
#  title            :string
#  description      :string
#  poster_url       :string
#  poster_large_url :string
#  rate             :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#
# Indexes
#
#  index_videos_on_category_id  (category_id)
#  index_videos_on_uuid         (uuid) UNIQUE
#

class Video < ActiveRecord::Base

  belongs_to :category

  # Default Values
  # Set :uuid attribute with UUID version 4
  default_value_for :uuid do
    SecureRandom.uuid
  end  


end
