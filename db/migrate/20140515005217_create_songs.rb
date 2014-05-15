class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :video_identifier, null: false
      t.belongs_to :band, index: true

      t.timestamps
    end
  end
end
