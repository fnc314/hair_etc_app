class CreateAppservs < ActiveRecord::Migration
  def change
    create_table :appservs do |t|
      t.belongs_to :appointment, index: true
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
