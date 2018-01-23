class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :education, :email, :phone, :link_to_resume, :work_experience
  # belongs_to :user
  # has_many :jobs
end
