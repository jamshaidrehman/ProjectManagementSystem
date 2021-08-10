class CreateTimeLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :time_logs do |t|
      t.time :start_time
      t.time :end_time
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
