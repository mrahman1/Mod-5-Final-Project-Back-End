class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :jobs
  # belongs_to :user
  # has_many :jobs
end
