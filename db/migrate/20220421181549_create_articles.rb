class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.timestamps
      t.string :titulo
      t.string :texto
      t.string :fecha
      t.string :categoria
      t.integer :precio
    end
  end
end
