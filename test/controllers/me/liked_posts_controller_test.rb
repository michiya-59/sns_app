# frozen_string_literal: true

require 'test_helper'

module Me
  class LikedPostsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @me_liked_post = me_liked_posts(:one)
    end

    test 'should get index' do
      get me_liked_posts_url
      assert_response :success
    end

    test 'should get new' do
      get new_me_liked_post_url
      assert_response :success
    end

    test 'should create me_liked_post' do
      assert_difference('Me::LikedPost.count') do
        post me_liked_posts_url, params: { me_liked_post: {} }
      end

      assert_redirected_to me_liked_post_url(Me::LikedPost.last)
    end

    test 'should show me_liked_post' do
      get me_liked_post_url(@me_liked_post)
      assert_response :success
    end

    test 'should get edit' do
      get edit_me_liked_post_url(@me_liked_post)
      assert_response :success
    end

    test 'should update me_liked_post' do
      patch me_liked_post_url(@me_liked_post), params: { me_liked_post: {} }
      assert_redirected_to me_liked_post_url(@me_liked_post)
    end

    test 'should destroy me_liked_post' do
      assert_difference('Me::LikedPost.count', -1) do
        delete me_liked_post_url(@me_liked_post)
      end

      assert_redirected_to me_liked_posts_url
    end
  end
end
