class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.references :stroll, foreign_key: true

      t.timestamps
    end
  end
end
