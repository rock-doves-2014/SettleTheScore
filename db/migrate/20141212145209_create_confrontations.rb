class CreateConfrontations < ActiveRecord::Migration
  def change
    create_table :confrontations do |t|
      t.string :title
      t.string :argument
      t.references :user
      t.timestamps
    end
  end
end
