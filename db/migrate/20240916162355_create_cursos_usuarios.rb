class CreateCursosUsuarios < ActiveRecord::Migration[7.2]
  def change
    create_table :cursos_usuarios do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
