class CreateRebuttals < ActiveRecord::Migration
  def change
    create_table :rebuttals do |t|
      t.string :counterargument
      t.references :user
      t.references :confrontation
      t.timestamps
    end
  end
end
