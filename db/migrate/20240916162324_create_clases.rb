class CreateClases < ActiveRecord::Migration[7.2]
  def change
    create_table :clases do |t|
      t.text :texto
      t.string :imagen
      t.string :video
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
