class CreateUsuarios < ActiveRecord::Migration[7.2]
  def change
    create_table :usuarios do |t|
      t.string :nombre_completo
      t.string :rut
      t.string :contraseña_digest
      t.string :tipo_u

      t.timestamps
    end
  end
end
