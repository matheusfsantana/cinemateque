class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :name
      t.references :actor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
