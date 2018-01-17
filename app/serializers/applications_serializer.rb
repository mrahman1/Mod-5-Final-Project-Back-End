class ApplicationsSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :candidate
  belongs_to :job
end
