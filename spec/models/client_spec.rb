require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should have_many(:jobs).dependent(:destroy) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:entity_type) }
  it { should validate_presence_of(:tax_id) }
end
