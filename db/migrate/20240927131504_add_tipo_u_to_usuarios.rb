class AddTipoUToUsuarios < ActiveRecord::Migration[7.2]
  def change
    add_column :usuarios, :tipo_u, :string
  end
end
