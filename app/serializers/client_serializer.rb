class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :company, :date_of_birth, :email, :phone, :street, :city, :state, :zip_code, :occupation, :entity_type, :tax_year_ends, :filing_status, :discontinue, :tax_id
  has_many :jobs
 
end
