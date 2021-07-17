class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :status, default: "alpha"
      t.string :version, default: "0.0.1"

      t.timestamps
    end
  end
end
