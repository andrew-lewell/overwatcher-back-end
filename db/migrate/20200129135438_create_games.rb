class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :result
      t.integer :sr
      t.references :season, null: false, foreign_key: true
      t.references :map, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: true

      t.timestamps
    end
  end
end
