class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :company_id, :jobs, :candidates
end
