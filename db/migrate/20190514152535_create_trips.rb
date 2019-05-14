class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :admin_id
      t.string :destination
      t.date :date
      t.string :picture_url

      t.timestamps
    end
  end
end
