class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :update, :destroy]

  # GET /applicants
  def index
    @applicants = Applicant.all

    render json: @applicants
  end

  # GET /applicants/1
  def show

     @applicant = Applicant.find_by(id: params[:id])
    if @applicant
      render json: @applicant
    else
      render json: {error: "applicant not found."}, status: 404
    end
  end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)
    # also create relevant applicantstage
    
    if @applicant.save
      ApplicantsStage.create(applicant_id:@applicant.id,stage_id:1,date:Date.today,time:Time.now.utc,duration:0,completed:false,outcome:false,email_sent:false,comment:'',location:'')
      render json: @applicant, status: :created, location: @applicant
    else
      render json: @applicant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      render json: @applicant
    else
      render json: @applicant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applicants/1
  def destroy
    @applicant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def applicant_params
      params.require(:applicant).permit(:full_name, :first_name, :last_name, :email, :phone_number)
    end
end





# fetch('http://localhost:3000/applicants', { 
#   method:'POST',
#   headers:{'Content-Type':'application/json',
#      'Accept':'application/json'
#      },
#      body:JSON.stringify({
#        applicant: {
#        full_name:'Malick Agne',
#        first_name:'Malick',
#        last_name:'Agne',
#        email:'malick.agne@example.com',
#        phone_number:nil
#      }}
#      )})
#       .then(res => res.json())
#       .then(applicants => console.log(applicants))