# frozen_string_literal: true

require 'test_helper'

module Users
  class LikedPostsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @users_liked_post = users_liked_posts(:one)
    end

    test 'should get index' do
      get users_liked_posts_url
      assert_response :success
    end

    test 'should get new' do
      get new_users_liked_post_url
      assert_response :success
    end

    test 'should create users_liked_post' do
      assert_difference('Users::LikedPost.count') do
        post users_liked_posts_url, params: { users_liked_post: {} }
      end

      assert_redirected_to users_liked_post_url(Users::LikedPost.last)
    end

    test 'should show users_liked_post' do
      get users_liked_post_url(@users_liked_post)
      assert_response :success
    end

    test 'should get edit' do
      get edit_users_liked_post_url(@users_liked_post)
      assert_response :success
    end

    test 'should update users_liked_post' do
      patch users_liked_post_url(@users_liked_post), params: { users_liked_post: {} }
      assert_redirected_to users_liked_post_url(@users_liked_post)
    end

    test 'should destroy users_liked_post' do
      assert_difference('Users::LikedPost.count', -1) do
        delete users_liked_post_url(@users_liked_post)
      end

      assert_redirected_to users_liked_posts_url
    end
  end
end
