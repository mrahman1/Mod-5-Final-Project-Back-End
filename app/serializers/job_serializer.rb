class JobSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :formattedTime, :title, :description, :user_id, :stages, :skills, :employment_type, :education_level, :position, :field, :status, :application_ids
  # belongs_to :user
  has_many :applications, :dependent => :destroy
  # has_many :candidates, through: :applications
  #has_many :candidates
  def formattedTime
    object.created_at.strftime("%Y-%m-%d")
  end
end
