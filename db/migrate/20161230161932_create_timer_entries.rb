class CreateTimerEntries < ActiveRecord::Migration
  def change
    create_table :timer_entries do |t|
      t.integer :seconds
      t.timestamps null: false
    end
  end
end
