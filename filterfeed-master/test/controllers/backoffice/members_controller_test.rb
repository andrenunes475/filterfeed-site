require 'test_helper'

class Backoffice::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_members_index_url
    assert_response :success
  end

end
