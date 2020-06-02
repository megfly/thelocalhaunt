class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :sighting
      t.text :noise
      t.text :smell
      t.text :cold_spot 
      t.text :summary
      t.date :date
      t.integer :rating
      t.integer :property_id
      t.integer :visitor_id

      t.timestamps
    end
  end
end
