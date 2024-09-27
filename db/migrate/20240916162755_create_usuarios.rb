class CreateUsuarios < ActiveRecord::Migration[7.2]
  def change
    create_table :usuarios do |t|
      t.string :nombre_completo
      t.string :rut
      t.string :contraseña_digest
      enum tipo_u: { estudiante: 'estudiante', profesor: 'profesor' }

      t.timestamps
    end
  end
end
