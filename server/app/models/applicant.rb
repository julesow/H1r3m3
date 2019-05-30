class Applicant < ApplicationRecord
    has_many :applicants_stages, dependent: :destroy
    has_many :stages, :through => :applicants_stages, dependent: :destroy

    def next_stage
        current_applicants_stage = self.applicants_stages.last
        current_stage_id = current_applicants_stage.stage.id
        ApplicantsStage.create(applicant_id:self.id,stage_id:current_stage_id + 1,date:Date.today,time:Time.now.utc,duration:0,completed:false,outcome:false,email_sent:false,comment:'',location:'')
    end
end
