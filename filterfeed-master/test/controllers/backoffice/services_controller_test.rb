require 'test_helper'

class Backoffice::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_services_index_url
    assert_response :success
  end

end
