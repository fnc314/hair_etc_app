class CreateStylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone, default: "4127219550"
      t.integer :years, default: 0
      t.string :title, default: "Stylist"
      t.string :bio_short, :limit => 175
      t.text :bio_full
      t.text :schedule, array: true, null: false, default: '{"Saturday"}'
      t.text :specialties, array: true, null: false, default: '{}'
      t.string :profile_pic, default: "https://s3.amazonaws.com/HairEtcPittsburgh/images/stylists/stylist_example_img.jpg"
      t.text :photos, array: true, null: false, default: '{}'

      t.timestamps
    end
  end
end

# Default profile_pic string is dedicated default image stored on Amazon S3 bucket