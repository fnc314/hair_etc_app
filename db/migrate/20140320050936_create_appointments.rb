class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :appt_date_time, null: false
      t.belongs_to :client, index: true
      t.belongs_to :stylist, index: true

      t.timestamps
    end
  end
end
