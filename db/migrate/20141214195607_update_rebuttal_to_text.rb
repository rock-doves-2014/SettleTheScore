class UpdateRebuttalToText < ActiveRecord::Migration
  def change
    change_column :rebuttals, :counterargument, :text
  end
end
