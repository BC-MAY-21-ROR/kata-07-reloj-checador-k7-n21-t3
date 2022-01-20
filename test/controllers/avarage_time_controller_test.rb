require "test_helper"

class AvarageTimeControllerTest < ActionDispatch::IntegrationTest
  test "should get month" do
    get avarage_time_month_url
    assert_response :success
  end
end
