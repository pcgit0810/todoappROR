class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :is_admin, :default => false
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
