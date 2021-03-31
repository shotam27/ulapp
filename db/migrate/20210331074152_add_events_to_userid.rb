class AddEventsToUserid < ActiveRecord::Migration[5.2]
  def change
    add_column :userids, :user_id, :integer
  end
end
