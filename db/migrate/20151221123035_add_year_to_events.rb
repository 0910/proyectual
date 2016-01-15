class AddYearToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :year_id, :integer
  end
end
