class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :recording_id
      t.text :description

      t.timestamps
    end
  end
end


