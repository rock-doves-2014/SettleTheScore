class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :confrontation
      t.boolean :vote
      t.timestamps
    end
  end
end
