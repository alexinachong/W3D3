class CreateVisit < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.string :url_id, null: false
      t.timestamps
    end

    add_index :visits, [:user_id, :url_id]
  end
end
