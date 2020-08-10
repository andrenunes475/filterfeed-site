require 'test_helper'

class Backoffice::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_clients_index_url
    assert_response :success
  end

end
