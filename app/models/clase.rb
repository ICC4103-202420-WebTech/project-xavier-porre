class Clase < ApplicationRecord
  # Una clase pertenece a un curso
  belongs_to :curso

  # Una clase tiene muchas preguntas
  has_many :preguntas, dependent: :destroy

  # relaciones para medir perogreso de usuarios
  has_many :progresos , dependent: :destroy
  has_many :usuarios, through: :progresos

  #inclucion de rich text
  has_rich_text :texto2
  
  # Validaciones
  validates :texto, presence: true
end
