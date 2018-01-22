class Stage < ApplicationRecord
  has_many :job_stages
  has_many :jobs, through: :jobs_stages
  has_many :applications
end
