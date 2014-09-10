class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :name
      t.decimal :price, precision: 4, scale: 2

      t.timestamps
    end
  end
end

# For clarity's sake: the precision is the number of significant digits, 
# while the scale is the number of digits that can be stored following the 
# decimal point. For example, the number 123.45 has a precision of 5 and a 
# scale of 2. A decimal with a precision of 5 and a scale of 2 can range 
# from -999.99 to 999.99.