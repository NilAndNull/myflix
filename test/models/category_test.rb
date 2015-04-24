# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  should have_many(:videos).order('title')
  should validate_presence_of(:name)

  test 'categories can have multiple videos' do
    comedy_videos = categories(:comedy).videos

    assert_not comedy_videos.nil?

    comedy_category = Category.find_by(name: 'Comedy')

    assert_not comedy_category.nil?
    assert_equal comedy_videos.size, Video.where(category: comedy_category).size
  end


# recent_videos method #

  test 'recent videos returns the right category' do
    animation_category = categories(:animation)
    recent_animation_videos = animation_category.recent_videos

    recent_animation_videos.each do |rav|
      # Checks that they belog to the right category
      assert_equal animation_category, rav.category
    end
  end

  test 'recent videos returns 6 videos' do
    all_videos = Video.all
    animation_category = categories(:animation)
    recent_animation_videos = animation_category.recent_videos

    assert_equal 6, recent_animation_videos.size
    assert_operator all_videos.size, :>, recent_animation_videos.size
  end

  test 'recent videos returns all category videos if there are less than 6' do
    comedy_category = categories(:comedy)
    comedy_videos = Video.all.where(category_id: Category.find_by(name: 'Comedy'))

    assert_equal comedy_videos.size, comedy_category.recent_videos.size
  end

  test 'recent videos returns the most recent ones' do 
    all_videos = Video.all
    animation_category = categories(:animation)
    recent_animation_videos = animation_category.recent_videos
    all_videos_except_recent = all_videos.reject { |v| recent_animation_videos.include?(v) }

    recent_animation_videos.each do |rav|
      # Checks if they are the most recent videos
      all_videos_except_recent.each do |v|
        assert rav.updated_at <= v.updated_at
      end
    end
  end

  test 'recent videos return by reversal order' do
    animation_category = categories(:animation)
    recent_animation_videos = animation_category.recent_videos
    first_video = recent_animation_videos.first

    recent_animation_videos.each do |rav|
      first_video.updated_at <= rav.updated_at
    end
  end

  test 'returns an empty array if there are no videos' do 
    music_category = categories(:music)

    assert music_category.recent_videos.empty?
  end

# end #

end
