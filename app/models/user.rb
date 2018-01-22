class User < ApplicationRecord
  has_secure_password
  belongs_to :company
  has_many :jobs
  has_many :candidates
  has_many :applications, through: :jobs
end
