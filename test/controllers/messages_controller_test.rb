require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get messages_new_url
    assert_response :success
  end

  test "should get edit" do
    get messages_edit_url
    assert_response :success
  end

end
