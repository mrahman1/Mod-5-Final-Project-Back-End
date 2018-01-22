class Application < ApplicationRecord
  belongs_to :job
  belongs_to :candidate
  has_many :stages, through: :jobs
end
