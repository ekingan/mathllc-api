class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :form
      t.string :states
      t.integer :status
      t.boolean :printed, default: false
      t.boolean :scanned, default: false
      t.boolean :uploaded, default: false
      t.date :filed
      t.boolean :accepted, default: false
      t.boolean :rejected, default: false
      t.text :notes
      t.integer :job_type
      t.float :price, default: 0.0
      t.boolean :confirm_ack, default: false
      t.boolean :paid_in_full, default: false
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
