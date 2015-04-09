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

require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  def setup
    @video = Video.new(title: "Movie Test I",
                       description: "Movie Test I Description",
                       category: categories(:tvshows))
  end


  test 'should save itself' do
    assert @video.save

    saved_video = Video.find(@video.id)

    assert_not saved_video.nil?
    assert_equal saved_video.title, @video.title
    assert_equal saved_video.description, @video.description
    assert_equal saved_video.category, @video.category
  end

  test 'has a category' do
    assert_not @video.category.nil?
    assert_equal @video.category.name, "TV Shows"
  end

end
