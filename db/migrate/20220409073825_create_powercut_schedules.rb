class CreatePowercutSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :powercut_schedules do |t|

      t.datetime :starting_period, null: false
      t.datetime :ending_period, null: false
      t.string :group_name, null: false
      t.string :unique_id, null: false

      t.timestamps
    end
  end
end
