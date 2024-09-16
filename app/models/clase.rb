class Clase < ApplicationRecord
  # Una clase pertenece a un curso
  belongs_to :curso

  # Una clase tiene muchas preguntas
  has_many :preguntas, dependent: :destroy

  # Validaciones
  validates :texto, presence: true
end
