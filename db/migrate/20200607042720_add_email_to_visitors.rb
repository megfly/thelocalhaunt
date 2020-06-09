class AddEmailToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_column :visitors, :email, :string
  end
end
