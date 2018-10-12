require 'rails_helper'

RSpec.describe Job, type: :model do
  it { should belong_to(:client) }
  it { should validate_presence_of(:form) }
  it { should validate_presence_of(:job_type) }
  it { should validate_presence_of(:price) }
end
