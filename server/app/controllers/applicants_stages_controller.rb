class ApplicantsStagesController < ApplicationController
  before_action :set_applicants_stage, only: [:show, :update, :destroy]

  # GET /applicants_stages
  def index
    @applicants_stages = ApplicantsStage.all

    render json: @applicants_stages
  end

  # GET /applicants_stages/1
  def show
    render json: @applicants_stage
  end

  # POST /applicants_stages
  def create
    @applicants_stage = ApplicantsStage.new(applicants_stage_params)

    if @applicants_stage.save
      render json: @applicants_stage, status: :created, location: @applicants_stage
    else
      render json: @applicants_stage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applicants_stages/1
  def update
    if @applicants_stage.update(applicants_stage_params)
      @applicants_stage.applicant.next_stage
      render json: @applicants_stage
    else
      render json: @applicants_stage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applicants_stages/1
  def destroy
    @applicants_stage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicants_stage
      @applicants_stage = ApplicantsStage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def applicants_stage_params
      params.require(:applicants_stage).permit(:applicant_id, :stage_id, :date, :time, :duration, :completed, :outcome, :email_sent, :comment, :location)
    end
end
