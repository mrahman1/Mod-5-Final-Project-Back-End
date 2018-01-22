class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :job_id, :candidate, :candidate_id, :stage_id, :stage
  #:candidate_id, :created_at, :stage_id, :stage_name, :candidate, :stage

end
