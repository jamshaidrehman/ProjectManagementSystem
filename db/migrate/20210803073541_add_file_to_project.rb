class AddFileToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :file, :string
  end
end
