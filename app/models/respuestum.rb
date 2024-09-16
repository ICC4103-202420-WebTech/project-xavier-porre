class Respuestum < ApplicationRecord
  # Una respuesta pertenece a un usuario
  belongs_to :usuario

  # Una respuesta pertenece a una pregunta
  belongs_to :pregunta

  # Validaciones
  validates :contenido, presence: true
end
