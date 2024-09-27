class Curso < ApplicationRecord
  belongs_to :creador, class_name: 'Usuario'
  has_many :clases, dependent: :destroy
  has_many :cursos_usuarios, dependent: :destroy
  has_many :usuarios, through: :cursos_usuarios

  # Validaciones
  validates :nombre, presence: true
  validates :descripcion, presence: true
end
