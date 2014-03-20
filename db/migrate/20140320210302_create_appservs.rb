class CreateAppservs < ActiveRecord::Migration
  def change
    create_table :appservs do |t|
      t.belongs_to :appointments, index: true
      t.belongs_to :services, index: true

      t.timestamps
    end
  end
end
