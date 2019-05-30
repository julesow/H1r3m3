class ApplicantsStageSerializer < ActiveModel::Serializer
  attributes :id, :completed, :stage, :comment, :completed, :date, :time, :duration, :email_sent, :location, :outcome 

  def stage
    StageSerializer.new(object.stage)
  end
end


