class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :company_id, :jobs, :applications
  has_many :jobs
  has_many :candidates
  has_many :applications, through: :jobs
end
