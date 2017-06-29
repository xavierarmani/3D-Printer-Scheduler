class Machines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :machineID
      t.string :machineDescription
      t.string :materialUsed

      t.timestamps null: false
    end
  end
end