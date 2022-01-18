require "test_helper"

class ManagementCompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get table" do
    get management_company_table_url
    assert_response :success
  end
end
