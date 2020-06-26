class AddVisitorIdToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :visitor_id, :integer
  end
end
