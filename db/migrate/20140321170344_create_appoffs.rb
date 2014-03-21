class CreateAppoffs < ActiveRecord::Migration
  def change
    create_table :appoffs do |t|
      t.belongs_to :appointment, index: true
      t.belongs_to :offering, index: true

      t.timestamps
    end
  end
end
