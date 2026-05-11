require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get show" do
    get loan_url(loans(:one))
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end
end
