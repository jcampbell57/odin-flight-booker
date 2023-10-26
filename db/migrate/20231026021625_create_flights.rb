class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :duration
      t.date :date
      t.time :time
      t.references :origin_airport, null: false, foreign_key: { to_table: :airports }
      t.references :destination_airport, null: false, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
