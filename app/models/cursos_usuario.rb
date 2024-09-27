class CursosUsuario < ApplicationRecord
  belongs_to :curso
  belongs_to :usuario
end
