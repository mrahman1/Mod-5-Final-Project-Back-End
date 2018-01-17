class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name
  belongs_to :user
  belongs_to :application, include_nested_associations: true
end
