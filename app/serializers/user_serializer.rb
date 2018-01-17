class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :company_id, :jobs
  has_many :jobs, include_nested_associations: true
  has_many :candidates
end
