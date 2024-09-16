class CreatePregunta < ActiveRecord::Migration[7.2]
  def change
    create_table :pregunta do |t|
      t.text :texto
      t.references :usuario, null: false, foreign_key: true
      t.references :clase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
