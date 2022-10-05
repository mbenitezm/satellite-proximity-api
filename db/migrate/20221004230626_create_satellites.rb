class CreateSatellites < ActiveRecord::Migration[7.0]
  def change
    create_table :satellites do |t|
      t.string      :name
      t.float       :lat
      t.float       :lon
      t.timestamps
    end

    add_index :satellites, :name, unique: true
  end
end
