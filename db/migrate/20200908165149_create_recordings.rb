class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.string :link
      t.integer :artist_id
      t.integer :song_id

      t.timestamps
    end
  end
end


