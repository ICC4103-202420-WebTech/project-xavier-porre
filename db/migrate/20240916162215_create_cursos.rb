class CreateCursos < ActiveRecord::Migration[7.2]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
