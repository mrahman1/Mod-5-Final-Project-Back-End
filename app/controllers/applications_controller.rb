class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]

  # GET /applications
  def index
    @applications = Application.all

    render json: @applications
  end

  # GET /applications/1
  def show
    render json: @application
  end

  # POST /applications
  def create
    @user = User.find_by(id: params[:user_id])
    @candidate = Candidate.find_by(id: params[:candidate_id])

      if !@candidate
        @candidate = Candidate.create(
          name: candidate_params[:candidate_name],
          user_id: params[:user_id]
        )
      end

    @application = Application.new(
      candidate_id: @candidate.id,
      job_id: params[:job_id]
    )

    if @application.save
      render json: @user
    else
      render json: @application.errors, status: :unprocessable_entity
    end

    # if @application.save
    #   render json: @application, status: :created, location: @application
    # else
    #   render json: @application.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /applications/1
  def update
    if @application.update(application_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  def destroy
    @application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def application_params
    #   params.require(:application).permit(:job_id, :candidate_id)
    # end
    #
    def candidate_params
      params.permit(:candidate_name)
    end
end
