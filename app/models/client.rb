class Client < ApplicationRecord

  has_many :jobs, dependent: :destroy

  validates_presence_of :last_name, :email, :entity_type, :tax_id
end
