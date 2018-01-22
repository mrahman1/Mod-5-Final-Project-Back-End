class JobStagesController < ApplicationController
  before_action :set_job_stage, only: [:show, :update, :destroy]

  # GET /job_stages
  def index
    @job_stages = JobStage.all

    render json: @job_stages
  end

  # GET /job_stages/1
  def show
    render json: @job_stage
  end

  # POST /job_stages
  def create
    @stage = Stage.find_by(id: params[:stage_id])

    if !@stage
      @stage = Stage.create(name: stage_params[:stage_name])
    end

    @job_stage = JobStage.new(
      job_id: params[:job_id],
      stage_id: @stage.id
    )

    @user = User.find_by(id: user_params[:user_id])
    if @job_stage.save
      render json: @user
    else
      render json: @job_stage.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /job_stages/1
  def update
    if @job_stage.update(job_stage_params)
      render json: @job_stage
    else
      render json: @job_stage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_stages/1
  def destroy
    @job_stage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_stage
      @job_stage = JobStage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_stage_params
      params.require(:job_stage).permit(:job_id, :stage_id)
    end

    def stage_params
      params.permit(:stage_name)
    end

    def user_params
      params.permit(:user_id)
    end

end
