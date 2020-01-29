class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :map
      t.string :map_type

      t.timestamps
    end
  end
end
