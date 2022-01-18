require "test_helper"

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get filter_day" do
    get attendance_filter_day_url
    assert_response :success
  end
end
