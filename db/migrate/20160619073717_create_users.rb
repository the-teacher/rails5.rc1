class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
