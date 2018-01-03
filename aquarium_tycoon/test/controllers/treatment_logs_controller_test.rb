require 'test_helper'

class TreatmentLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment_log = treatment_logs(:one)
  end

  test "should get index" do
    get treatment_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_log_url
    assert_response :success
  end

  test "should create treatment_log" do
    assert_difference('TreatmentLog.count') do
      post treatment_logs_url, params: { treatment_log: { animal_id: @treatment_log.animal_id, employee_id: @treatment_log.employee_id, medicine: @treatment_log.medicine, quantity: @treatment_log.quantity, time: @treatment_log.time, treatment_id: @treatment_log.treatment_id } }
    end

    assert_redirected_to treatment_log_url(TreatmentLog.last)
  end

  test "should show treatment_log" do
    get treatment_log_url(@treatment_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_log_url(@treatment_log)
    assert_response :success
  end

  test "should update treatment_log" do
    patch treatment_log_url(@treatment_log), params: { treatment_log: { animal_id: @treatment_log.animal_id, employee_id: @treatment_log.employee_id, medicine: @treatment_log.medicine, quantity: @treatment_log.quantity, time: @treatment_log.time, treatment_id: @treatment_log.treatment_id } }
    assert_redirected_to treatment_log_url(@treatment_log)
  end

  test "should destroy treatment_log" do
    assert_difference('TreatmentLog.count', -1) do
      delete treatment_log_url(@treatment_log)
    end

    assert_redirected_to treatment_logs_url
  end
end
