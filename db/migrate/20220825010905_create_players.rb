class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.boolean :free_agent
      t.integer :salary

      t.timestamps
    end
  end
end
