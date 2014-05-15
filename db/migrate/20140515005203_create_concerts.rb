class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.date :date, null: false
      t.belongs_to :band, null: false, index: true
      t.belongs_to :venue, null: false, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
