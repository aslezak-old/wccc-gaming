class AddEventDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :event_date, :datetime
  end
end
