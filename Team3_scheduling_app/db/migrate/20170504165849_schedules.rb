class Schedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :machineID
      t.string :userName
      t.datetime :startTime
      t.datetime :endTime

      t.timestamps null: false
    end
  end
end

