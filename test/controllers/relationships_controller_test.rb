require 'test_helper'

class RelationShiopsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_user" do
    get relation_shiops_follow_user_url
    assert_response :success
  end

  test "should get unfollow_user" do
    get relation_shiops_unfollow_user_url
    assert_response :success
  end

end
