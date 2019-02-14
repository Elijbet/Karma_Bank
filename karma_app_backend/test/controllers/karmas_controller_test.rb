require 'test_helper'

class KarmasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @karma = karmas(:one)
  end

  test "should get index" do
    get karmas_url, as: :json
    assert_response :success
  end

  test "should create karma" do
    assert_difference('Karma.count') do
      post karmas_url, params: { karma: { date: @karma.date, entry: @karma.entry } }, as: :json
    end

    assert_response 201
  end

  test "should show karma" do
    get karma_url(@karma), as: :json
    assert_response :success
  end

  test "should update karma" do
    patch karma_url(@karma), params: { karma: { date: @karma.date, entry: @karma.entry } }, as: :json
    assert_response 200
  end

  test "should destroy karma" do
    assert_difference('Karma.count', -1) do
      delete karma_url(@karma), as: :json
    end

    assert_response 204
  end
end
