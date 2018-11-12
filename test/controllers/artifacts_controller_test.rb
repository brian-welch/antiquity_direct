require 'test_helper'

class ArtifactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artifacts_index_url
    assert_response :success
  end

  test "should get show" do
    get artifacts_show_url
    assert_response :success
  end

  test "should get new" do
    get artifacts_new_url
    assert_response :success
  end

  test "should get create" do
    get artifacts_create_url
    assert_response :success
  end

end
