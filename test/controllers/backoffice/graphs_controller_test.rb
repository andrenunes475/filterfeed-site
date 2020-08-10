require 'test_helper'

class Backoffice::GraphsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_graphs_index_url
    assert_response :success
  end

end
