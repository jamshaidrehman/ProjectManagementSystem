require 'test_helper'

class TimeLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get time_logs_index_url
    assert_response :success
  end

end
