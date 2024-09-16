class CreateRespuesta < ActiveRecord::Migration[7.2]
  def change
    create_table :respuesta do |t|
      t.text :texto
      t.references :usuario, null: false, foreign_key: true
      t.references :pregunta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
