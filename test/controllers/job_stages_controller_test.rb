require 'test_helper'

class JobStagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_stage = job_stages(:one)
  end

  test "should get index" do
    get job_stages_url, as: :json
    assert_response :success
  end

  test "should create job_stage" do
    assert_difference('JobStage.count') do
      post job_stages_url, params: { job_stage: { job_id: @job_stage.job_id, stage_id: @job_stage.stage_id } }, as: :json
    end

    assert_response 201
  end

  test "should show job_stage" do
    get job_stage_url(@job_stage), as: :json
    assert_response :success
  end

  test "should update job_stage" do
    patch job_stage_url(@job_stage), params: { job_stage: { job_id: @job_stage.job_id, stage_id: @job_stage.stage_id } }, as: :json
    assert_response 200
  end

  test "should destroy job_stage" do
    assert_difference('JobStage.count', -1) do
      delete job_stage_url(@job_stage), as: :json
    end

    assert_response 204
  end
end
