class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.integer :sensor_type
      t.integer :value
      t.datetime :time
      t.integer :tablet_id

      t.timestamps
    end
  end
end
