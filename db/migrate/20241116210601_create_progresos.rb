class CreateProgresos < ActiveRecord::Migration[7.2]
  def change
    create_table :progresos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :clase, null: false, foreign_key: true
      t.boolean :completado

      t.timestamps
    end
  end
end
