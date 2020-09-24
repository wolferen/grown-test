class CreateTablets < ActiveRecord::Migration[6.0]
  def change
    create_table :tablets do |t|
      t.integer :device_id
      t.integer :user_id

      t.timestamps
    end
  end
end
