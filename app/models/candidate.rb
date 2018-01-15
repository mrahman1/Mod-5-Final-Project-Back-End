class Candidate < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :jobs, through: :applications
end
