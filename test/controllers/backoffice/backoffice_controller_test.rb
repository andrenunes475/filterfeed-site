require 'test_helper'

class Backoffice::BackofficeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_backoffice_index_url
    assert_response :success
  end

end
