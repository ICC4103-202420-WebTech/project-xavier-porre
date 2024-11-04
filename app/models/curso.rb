class Curso < ApplicationRecord
  
  belongs_to :creador, class_name: 'Usuario'
  has_many :clases, dependent: :destroy
  has_many :cursos_usuarios, dependent: :destroy
  has_many :usuarios, through: :cursos_usuarios
  has_rich_text :descripcion2


  # Validaciones
  validates :nombre, presence: true
  validates :descripcion2, presence: true
end
