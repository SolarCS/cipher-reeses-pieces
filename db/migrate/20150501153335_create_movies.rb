class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.string :censored_name
      t.string :artist
      t.integer :track_id
      t.references :user
      t.timestamps
    end
  end
end
