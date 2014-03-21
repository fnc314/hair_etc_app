class CreateStylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone, default: "4127219550"

      t.timestamps
    end
  end
end
