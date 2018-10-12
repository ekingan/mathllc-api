class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :last_name
      t.string :first_name
      t.string :company
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :occupation
      t.integer :entity_type
      t.date :tax_year_ends
      t.integer :filing_status
      t.boolean :discontinue, default: false
      t.integer :tax_id

      t.timestamps
    end
  end
end
