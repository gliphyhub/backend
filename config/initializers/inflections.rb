# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
 ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
#==================================================
#===============Pluralizaciones====================
	inflect.irregular 'tipo', 'tipos'
	inflect.irregular 'genero', 'generos'
 	inflect.irregular 'perfil', 'perfiles'
 	inflect.irregular 'profesor', 'profesores'
 	inflect.irregular 'tutor', 'tutores'
 	inflect.irregular 'alumno', 'alumnos'
 	inflect.irregular 'generacion', 'generaciones'
 	inflect.irregular 'grupo', 'grupos'
 	inflect.irregular 'nivel', 'niveles'
 	inflect.irregular 'grado', 'grados'
 	inflect.irregular 'materia', 'materias'
 	inflect.irregular 'color', 'colores'
 	inflect.irregular 'publicacion', 'publicaciones'
 	inflect.irregular 'archivo', 'archivos'
 	inflect.irregular 'comunicado', 'comunicados'
 	inflect.irregular 'administrador', 'administradores'

#==================================================
#==================================================
 end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
