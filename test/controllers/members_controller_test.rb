require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get show" do
    get member_url(members(:one))
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference("Member.count") do
      post members_url, params: { member: { name: "Novy Clen", email: "novy@example.com" } }
    end
    assert_redirected_to member_url(Member.last)
  end
end
