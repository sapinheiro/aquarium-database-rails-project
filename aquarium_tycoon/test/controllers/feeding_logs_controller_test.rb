require 'test_helper'

class FeedingLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feeding_log = feeding_logs(:one)
  end

  test "should get index" do
    get feeding_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_feeding_log_url
    assert_response :success
  end

  test "should create feeding_log" do
    assert_difference('FeedingLog.count') do
      post feeding_logs_url, params: { feeding_log: { employee_id: @feeding_log.employee_id, feeding_id: @feeding_log.feeding_id, food: @feeding_log.food, quantity: @feeding_log.quantity, tank_id: @feeding_log.tank_id, time: @feeding_log.time } }
    end

    assert_redirected_to feeding_log_url(FeedingLog.last)
  end

  test "should show feeding_log" do
    get feeding_log_url(@feeding_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_feeding_log_url(@feeding_log)
    assert_response :success
  end

  test "should update feeding_log" do
    patch feeding_log_url(@feeding_log), params: { feeding_log: { employee_id: @feeding_log.employee_id, feeding_id: @feeding_log.feeding_id, food: @feeding_log.food, quantity: @feeding_log.quantity, tank_id: @feeding_log.tank_id, time: @feeding_log.time } }
    assert_redirected_to feeding_log_url(@feeding_log)
  end

  test "should destroy feeding_log" do
    assert_difference('FeedingLog.count', -1) do
      delete feeding_log_url(@feeding_log)
    end

    assert_redirected_to feeding_logs_url
  end
end
