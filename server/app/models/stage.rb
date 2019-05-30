class Stage < ApplicationRecord
    has_many:applicants_stage
    has_many:applicants, :through => :applicants_stage
end
