class CreateApplicantsStages < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants_stages do |t|
      t.references :applicant, foreign_key: true
      t.references :stage, foreign_key: true
      t.date :date
      t.time :time
      t.float :duration
      t.boolean :completed
      t.boolean :outcome
      t.boolean :email_sent
      t.text :comment
      t.string :location

      t.timestamps
    end
  end
end
