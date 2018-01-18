class Candidate < ApplicationRecord
  belongs_to :user
  has_many :applications, :dependent => :destroy
  has_many :jobs, through: :applications
end
