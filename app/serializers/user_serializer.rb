class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :company_id, :jobs
  has_many :jobs
  has_many :candidates
end
