class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :patient
      t.references :doctor
      t.integer :status
      t.date :from_time
      t.date :to_time

      t.timestamps
    end
  end
end
