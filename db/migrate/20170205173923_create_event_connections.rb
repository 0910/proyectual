class CreateEventConnections < ActiveRecord::Migration
  def change
    create_table "event_connections", :force => true, :id => false do |t|
      t.integer "event_a_id", :null => false
      t.integer "event_b_id", :null => false
    end
  end
end
