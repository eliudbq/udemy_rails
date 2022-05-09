class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name
      t.string :mail
    end
  end
end
