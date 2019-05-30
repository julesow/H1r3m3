class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :first_name, :last_name, :email, :phone_number, :current_applicants_stage

  #  has_many :applicants_stage

  def current_applicants_stage
    if object.applicants_stages.length > 0
      ApplicantsStageSerializer.new(object.applicants_stages.last)
    else
      nil
    end
  end

  # class ApplicantsStageSerializer < ActiveModel::Serializer
  #   attributes :id, :stage_id, :date, :time, :duration, :completed, :outcome, :email_sent, :comment, :location
  # end
end
