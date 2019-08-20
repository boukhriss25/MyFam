require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get documents_index_url
    assert_response :success
  end

  test "should get show" do
    get documents_show_url
    assert_response :success
  end

  test "should get new" do
    get documents_new_url
    assert_response :success
  end

  test "should get create" do
    get documents_create_url
    assert_response :success
  end

  test "should get destroy" do
    get documents_destroy_url
    assert_response :success
  end

  test "should get search" do
    get documents_search_url
    assert_response :success
  end

end
