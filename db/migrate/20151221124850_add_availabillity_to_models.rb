class AddAvailabillityToModels < ActiveRecord::Migration
  def change
  	add_column :artists, :available, :string, :default => 'Yes'
  	add_column :events, :available, :string, :default => 'Yes'
  	add_column :events, :featured, :string, :default => 'No'
  	add_column :news, :available, :string, :default => 'Yes'
  	add_column :videos, :available, :string, :default => 'Yes'
  end
end
