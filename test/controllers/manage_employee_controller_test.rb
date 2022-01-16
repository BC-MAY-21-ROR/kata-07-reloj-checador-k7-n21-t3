require "test_helper"

class ManageEmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get table" do
    get manage_employee_table_url
    assert_response :success
  end
end
