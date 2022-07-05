require "test_helper"

class PrincipalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get principal_index_url
    assert_response :success
  end
end
