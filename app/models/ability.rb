# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(usuario)
    # Los usuarios no autenticados tienen permisos limitados
    return unless usuario

    if usuario.tipo_u == 'profesor'
      can :manage, Curso, creador_id: usuario.id
      can :read, Curso
      can :manage, Clase, curso: { creador_id: usuario.id }
    elsif usuario.tipo_u == 'estudiante'
      can :read, Curso, cursos_usuarios: { usuario_id: usuario.id }
      can :read, Clase, curso: { cursos_usuarios: { usuario_id: usuario.id } }
    end

    # Otros permisos globales
    can :read, Curso # Todos los usuarios pueden ver los cursos públicos
  end
end
