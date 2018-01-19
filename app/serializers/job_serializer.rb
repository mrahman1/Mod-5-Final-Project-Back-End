class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  # belongs_to :user
  has_many :applications, :dependent => :destroy
  # has_many :candidates, through: :applications
  #has_many :candidates
end
