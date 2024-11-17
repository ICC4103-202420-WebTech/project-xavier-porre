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
      # Permitir a los estudiantes inscribirse en cursos si no están inscritos
      can :inscribir, Curso do |curso|
        !curso.cursos_usuarios.exists?(usuario_id: usuario.id)
      end

      # Permitir a los estudiantes desinscribirse de cursos si están inscritos
      can :desinscribir, Curso do |curso|
        curso.cursos_usuarios.exists?(usuario_id: usuario.id)
      end

      # Permitir a los estudiantes leer clases si están inscritos
      can :read, Clase do |clase|
        clase.curso.cursos_usuarios.exists?(usuario_id: usuario.id)
      end

      # Permitir a los estudiantes crear preguntas si están inscritos
      can :create, Pregunta do |pregunta|
        pregunta.clase.curso.cursos_usuarios.exists?(usuario_id: usuario.id)
      end
    end
  end
end
