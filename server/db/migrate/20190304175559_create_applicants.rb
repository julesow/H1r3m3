class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
