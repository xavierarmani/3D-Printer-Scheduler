class Materials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :material_type

      t.timestamps null: false
    end
  end
end
