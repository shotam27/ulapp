class ChangeDatatypeStartTimeOfEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :start_time, 'date'
  end
end
