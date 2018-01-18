class JobSerializer < ActiveModel::Serializer
  attributes :id
  # belongs_to :user
  has_many :applications, :dependent => :destroy
  # has_many :candidates, through: :applications
  #has_many :candidates
end
