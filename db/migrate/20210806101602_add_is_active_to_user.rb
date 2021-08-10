class AddIsActiveToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_active, :boolean, default: true
    add_column :users, :image, :string
  end
end
