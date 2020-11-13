class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :status
      t.string :version

      t.timestamps
    end
  end
end
