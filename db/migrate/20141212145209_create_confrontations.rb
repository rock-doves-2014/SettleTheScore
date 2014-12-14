class CreateConfrontations < ActiveRecord::Migration
  def change
    create_table :confrontations do |t|
      t.string :title
      t.text :argument
      t.references :user
      t.timestamps
    end
  end
end
