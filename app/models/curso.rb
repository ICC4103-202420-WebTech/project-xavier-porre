class Curso < ApplicationRecord
  # Un curso pertenece a su creador
  belongs_to :creador
    # Un curso tiene muchas clases
  has_many :clases, dependent: :destroy

  # Un curso tiene muchas preguntas a través de las clases
  has_many :preguntas, through: :clases

  # Validaciones
  validates :nombre, presence: true
  validates :descripcion, presence: true
end
