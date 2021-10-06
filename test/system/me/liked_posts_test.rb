require "application_system_test_case"

class Me::LikedPostsTest < ApplicationSystemTestCase
  setup do
    @me_liked_post = me_liked_posts(:one)
  end

  test "visiting the index" do
    visit me_liked_posts_url
    assert_selector "h1", text: "Me/Liked Posts"
  end

  test "creating a Liked post" do
    visit me_liked_posts_url
    click_on "New Me/Liked Post"

    click_on "Create Liked post"

    assert_text "Liked post was successfully created"
    click_on "Back"
  end

  test "updating a Liked post" do
    visit me_liked_posts_url
    click_on "Edit", match: :first

    click_on "Update Liked post"

    assert_text "Liked post was successfully updated"
    click_on "Back"
  end

  test "destroying a Liked post" do
    visit me_liked_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liked post was successfully destroyed"
  end
end
