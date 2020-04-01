require "application_system_test_case"

class CollsTest < ApplicationSystemTestCase
  setup do
    @coll = colls(:one)
  end

  test "visiting the index" do
    visit colls_url
    assert_selector "h1", text: "Colls"
  end

  test "creating a Coll" do
    visit colls_url
    click_on "New Coll"

    fill_in "Body", with: @coll.body
    fill_in "Title", with: @coll.title
    click_on "Create Coll"

    assert_text "Coll was successfully created"
    click_on "Back"
  end

  test "updating a Coll" do
    visit colls_url
    click_on "Edit", match: :first

    fill_in "Body", with: @coll.body
    fill_in "Title", with: @coll.title
    click_on "Update Coll"

    assert_text "Coll was successfully updated"
    click_on "Back"
  end

  test "destroying a Coll" do
    visit colls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coll was successfully destroyed"
  end
end
