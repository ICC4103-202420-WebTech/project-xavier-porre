class Usuario < ApplicationRecord
  # Un usuario puede crear muchos cursos
  has_many :cursos, dependent: :destroy
  # Un usuario puede hacer muchas preguntas
  has_many :preguntas, dependent: :destroy

  # Un usuario puede hacer muchas respuestas
  has_many :respuestas, dependent: :destroy

  # Validaciones para los campos del usuario
  validates :rut, presence: true, uniqueness: true
  validates :nombre_completo, presence: true
  validates :contraseña, presence: true
end
