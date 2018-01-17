class AuthSerializer < ActiveModel::Serializer
  attributes :id, :email, :jwt, :candidates, :jobs
end
