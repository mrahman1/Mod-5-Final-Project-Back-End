class JobSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :user_id, :title, :description, :candidates
  belongs_to :user
  has_many :applications, include_nested_associations: true
end
