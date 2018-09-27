class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :origin
      t.string :destination
      t.decimal :cost
      t.string :containers
      t.timestamps
    end
  end
end
