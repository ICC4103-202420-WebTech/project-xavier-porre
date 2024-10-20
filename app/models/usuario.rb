class Usuario < ApplicationRecord
  # Un usuario puede crear muchos cursos
  has_many :cursos, dependent: :destroy
  # Un usuario puede hacer muchas preguntas
  has_many :preguntas, dependent: :destroy
  # Un usuario puede hacer muchas respuestas
  has_many :respuestas, dependent: :destroy
  # Un usuario tiene contrseña segura
  has_secure_password

  # Validaciones para los campos del usuario
  validates :rut, presence: true, uniqueness: true
  validates :nombre_completo, presence: true
  validates :password_digest, presence: true
  validates :tipo_u, presence: true, inclusion: { in: %w(estudiante profesor), message: "%{value} no es un tipo de usuario válido" }
end
