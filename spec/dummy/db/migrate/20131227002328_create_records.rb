class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.decimal :field1, precision: 10, scale: 8
      t.decimal :field2, precision: 10, scale: 8
    end
  end
end
