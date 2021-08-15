class CreateTodolists < ActiveRecord::Migration[6.1]
  def change
    create_table :todolists do |t|
      t.references :user
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
