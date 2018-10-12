class Job < ApplicationRecord
  belongs_to :client

  validates_presence_of :form, :job_type, :price
end
