class RenameContrasenaDigestToPasswordDigest < ActiveRecord::Migration[7.2]
  def change
    rename_column :usuarios, :contraseña_digest, :password_digest
  end
end
