require 'test_helper'

class ApplicantsStagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicants_stage = applicants_stages(:one)
  end

  test "should get index" do
    get applicants_stages_url, as: :json
    assert_response :success
  end

  test "should create applicants_stage" do
    assert_difference('ApplicantsStage.count') do
      post applicants_stages_url, params: { applicants_stage: { applicant_id: @applicants_stage.applicant_id, comment: @applicants_stage.comment, completed: @applicants_stage.completed, date: @applicants_stage.date, duration: @applicants_stage.duration, email_sent: @applicants_stage.email_sent, location: @applicants_stage.location, outcome: @applicants_stage.outcome, stage_id: @applicants_stage.stage_id, time: @applicants_stage.time } }, as: :json
    end

    assert_response 201
  end

  test "should show applicants_stage" do
    get applicants_stage_url(@applicants_stage), as: :json
    assert_response :success
  end

  test "should update applicants_stage" do
    patch applicants_stage_url(@applicants_stage), params: { applicants_stage: { applicant_id: @applicants_stage.applicant_id, comment: @applicants_stage.comment, completed: @applicants_stage.completed, date: @applicants_stage.date, duration: @applicants_stage.duration, email_sent: @applicants_stage.email_sent, location: @applicants_stage.location, outcome: @applicants_stage.outcome, stage_id: @applicants_stage.stage_id, time: @applicants_stage.time } }, as: :json
    assert_response 200
  end

  test "should destroy applicants_stage" do
    assert_difference('ApplicantsStage.count', -1) do
      delete applicants_stage_url(@applicants_stage), as: :json
    end

    assert_response 204
  end
end
