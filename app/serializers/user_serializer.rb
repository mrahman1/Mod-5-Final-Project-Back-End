class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :company_id, :jobs, :applications
  has_many :candidates
  has_many :applications, through: :jobs
  has_many :jobs
end
