require 'test_helper'

class CollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coll = colls(:one)
  end

  test "should get index" do
    get colls_url
    assert_response :success
  end

  test "should get new" do
    get new_coll_url
    assert_response :success
  end

  test "should create coll" do
    assert_difference('Coll.count') do
      post colls_url, params: { coll: { body: @coll.body, title: @coll.title } }
    end

    assert_redirected_to coll_url(Coll.last)
  end

  test "should show coll" do
    get coll_url(@coll)
    assert_response :success
  end

  test "should get edit" do
    get edit_coll_url(@coll)
    assert_response :success
  end

  test "should update coll" do
    patch coll_url(@coll), params: { coll: { body: @coll.body, title: @coll.title } }
    assert_redirected_to coll_url(@coll)
  end

  test "should destroy coll" do
    assert_difference('Coll.count', -1) do
      delete coll_url(@coll)
    end

    assert_redirected_to colls_url
  end
end
