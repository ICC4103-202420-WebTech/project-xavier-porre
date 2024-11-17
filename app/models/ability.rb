class Ability
  include CanCan::Ability

  def initialize(usuario)
    # Permisos para usuarios no autenticados
    can :read, Curso

    return unless usuario # Si no hay usuario autenticado, termina aquí.

    if usuario.tipo_u == 'profesor'
      # Permitir a los profesores gestionar los cursos que crearon
      can :manage, Curso, creador_id: usuario.id
      can :manage, Clase, curso: { creador_id: usuario.id }
      can :manage, Pregunta, clase: { curso: { creador_id: usuario.id } }
    elsif usuario.tipo_u == 'estudiante'
      # Permitir a los estudiantes inscribirse/desinscribirse de cursos
      can [:read, :inscribir, :desinscribir], Curso do |curso|
        curso.cursos_usuarios.where(usuario_id: usuario.id).empty?
      end

      # Permitir a los estudiantes leer clases y hacer preguntas si están inscritos
      can :read, Clase do |clase|
        clase.curso.cursos_usuarios.exists?(usuario_id: usuario.id)
      end

      can :create, Pregunta do |pregunta|
        pregunta.clase.curso.cursos_usuarios.exists?(usuario_id: usuario.id)
      end
    end
  end
end
