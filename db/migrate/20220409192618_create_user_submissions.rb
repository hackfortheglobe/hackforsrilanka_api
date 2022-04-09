class CreateUserSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_submissions do |t|
      t.belongs_to :station, foreign_key: true, null: false
      t.integer :wait_time
      t.integer :gas_type, null: false
      t.integer :availability, null: false
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.datetime 'submitted_at', null: false

      t.timestamps
    end
  end
end
