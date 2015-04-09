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

  should belong_to(:category)
  should validate_presence_of(:title)
  should validate_presence_of(:description)

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
    assert_equal saved_video.uuid, @video.uuid
  end

  test 'has a category' do
    assert_not @video.category.nil?
    assert_equal @video.category.name, "TV Shows"
  end


  # Test Search by Title
  test 'search empty string' do
    result = Video.search_by_title("")

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal Video.all.size, result.size
  end

  test 'search with nil' do
    result = Video.search_by_title(nil)

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal Video.all.size, result.size
  end

  test 'search a string with only spaces' do
    result = Video.search_by_title("  ")

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 0, result.size
  end

  test 'search a non existing video' do
    result = Video.search_by_title("NEV: Non Existing Video")

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 0, result.size
  end

  test 'search an existing video with a complete title' do 
    monk = videos(:monk)
    result = Video.search_by_title(monk.title)

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 1, result.size
  end

  test 'search an existing video with a partial title' do 
    futurama = videos(:futurama)
    result = Video.search_by_title('rama')

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 1, result.size
    assert_equal futurama, result.first
  end

  test 'search a term that returns more than one good result, ordered by title' do
    family_guy = videos(:family_guy)
    futurama = videos(:futurama) 
    result = Video.search_by_title('f')

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 2, result.size
    assert_equal family_guy, result.first
    assert_equal futurama, result.second
  end

  test 'search is case insensitive' do 
    monk = videos(:monk)
    results = []
    results.push Video.search_by_title(monk.title.upcase)
    results.push Video.search_by_title(monk.title.downcase)
    results.push Video.search_by_title(monk.title.capitalize)

    results.each do |result|
      assert_not result.nil?
      assert_equal Array, result.class
      assert_equal 1, result.size
      assert_equal monk, result.first
    end

  end

  test 'search term with more than 255 chars' do
    result = Video.search_by_title("A" * 100000)

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 0, result.size
  end

  test 'search term with less or equal than 255 chars' do
    result = Video.search_by_title("A" * 255)

    assert_not result.nil?
    assert_equal Array, result.class
    assert_equal 0, result.size
  end

end
