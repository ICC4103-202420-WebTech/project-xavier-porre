class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Un usuario puede crear muchos cursos
  has_many :cursos_usuarios
  has_many :cursos, dependent: :destroy, through: :cursos_usuarios
  # Relaciones para medir progreso de clases
  has_many :progresos
  has_many :clases, through: :progresos
  # Un usuario puede hacer muchas preguntas
  has_many :preguntas, dependent: :destroy
  # Un usuario puede hacer muchas respuestas
  has_many :respuestas, dependent: :destroy
  # Validaciones para los campos del usuario
  validates :rut, presence: true, uniqueness: true
  validates :nombre_completo, presence: true
  validates :password, presence: true
  validates :tipo_u, presence: true, inclusion: { in: %w(estudiante profesor), message: "%{value} no es un tipo de usuario válido" }
end
