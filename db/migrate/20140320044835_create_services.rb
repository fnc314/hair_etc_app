class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
