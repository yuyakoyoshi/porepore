class User < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,     null: false
      t.string :login_id, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
