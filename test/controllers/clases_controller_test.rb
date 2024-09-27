require "test_helper"

class ClasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clases_index_url
    assert_response :success
  end

  test "should get show" do
    get clases_show_url
    assert_response :success
  end
end
