class CreateConfrontationTags < ActiveRecord::Migration
  def change
    create_table :confrontation_tags do |t|
      t.references :confrontation
      t.references :tag
      t.timestamps
    end
  end
end
