class Candidate < ApplicationRecord
  has_many :applications
  has_many :jobs, through: :applications
end
