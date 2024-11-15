class Pregunta < ApplicationRecord
  # Una pregunta pertenece a un usuario
  belongs_to :usuario

  # Una pregunta pertenece a una clase
  belongs_to :clase

  # Una pregunta tiene muchas respuestas
  has_many :respuestas, dependent: :destroy

  # Validaciones
  validates :contenido, presence: true
end
