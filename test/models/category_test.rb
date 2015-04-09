require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  should have_many(:videos).order('title')
  should validate_presence_of(:name)

  test 'categories can have multiple videos' do
    comedy_videos = categories(:comedies).videos

    assert_not comedy_videos.nil?

    comedy_category = Category.find_by(name: 'TV Comedies')

    assert_not comedy_category.nil?
    assert_equal comedy_videos.size, Video.where(category: comedy_category).size
  end


end