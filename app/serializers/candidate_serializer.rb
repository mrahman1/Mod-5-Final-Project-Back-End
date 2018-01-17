class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name
  belongs_to :user
  # has_many :applications
  # has_many :jobs, through: :applications
  has_many :jobs
end
