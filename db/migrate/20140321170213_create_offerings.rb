class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :name
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
