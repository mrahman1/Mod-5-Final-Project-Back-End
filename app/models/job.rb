class Job < ApplicationRecord
  belongs_to :user
  has_many :applications, :dependent => :destroy
  has_many :candidates, through: :applications
  has_many :job_stages
  has_many :stages, through: :job_stages
end
