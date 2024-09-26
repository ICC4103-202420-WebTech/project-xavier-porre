class Usuario < ApplicationRecord
  # Un usuario puede crear muchos cursos
  has_many :cursos, dependent: :destroy
  # Un usuario puede hacer muchas preguntas
  has_many :preguntas, dependent: :destroy
  # Un usuario puede hacer muchas respuestas
  has_many :respuestas, dependent: :destroy
  #Un usuario puede ser profesor o estudiante
  enum tipo_u: { estudiante: "estudiante", profesor: "profesor" }

  # Validaciones para los campos del usuario
  validates :rut, presence: true, uniqueness: true
  validates :nombre_completo, presence: true
  validates :contraseña, presence: true
  validates :tipo_u, presence: true, inclusion: { in: tipo_us.keys }
end
