class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.integer :max_containers
      t.string :name

      t.timestamps
    end
  end
end
