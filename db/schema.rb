# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170611193337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archivos", force: :cascade do |t|
    t.integer  "publicacion_id"
    t.string   "nombre"
    t.string   "ruta"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publicacion_id"], name: "index_archivos_on_publicacion_id", using: :btree
  end

  create_table "colores", force: :cascade do |t|
    t.string   "color"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comunicado_archivos", force: :cascade do |t|
    t.integer  "comunicado_id"
    t.string   "nombre"
    t.string   "ruta"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["comunicado_id"], name: "index_comunicado_archivos_on_comunicado_id", using: :btree
  end

  create_table "comunicado_grupos", force: :cascade do |t|
    t.integer  "grupo_id"
    t.integer  "comunicado_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["comunicado_id"], name: "index_comunicado_grupos_on_comunicado_id", using: :btree
    t.index ["grupo_id"], name: "index_comunicado_grupos_on_grupo_id", using: :btree
  end

  create_table "comunicado_profesores", force: :cascade do |t|
    t.integer  "perfil_profesor_id"
    t.integer  "comunicado_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["comunicado_id"], name: "index_comunicado_profesores_on_comunicado_id", using: :btree
    t.index ["perfil_profesor_id"], name: "index_comunicado_profesores_on_perfil_profesor_id", using: :btree
  end

  create_table "comunicado_tutores", force: :cascade do |t|
    t.integer  "perfil_tutor_id"
    t.integer  "comunicado_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["comunicado_id"], name: "index_comunicado_tutores_on_comunicado_id", using: :btree
    t.index ["perfil_tutor_id"], name: "index_comunicado_tutores_on_perfil_tutor_id", using: :btree
  end

  create_table "comunicados", force: :cascade do |t|
    t.string   "titulo"
    t.text     "mensaje"
    t.text     "mensaje_markdown"
    t.integer  "visitas",          default: 0
    t.boolean  "prioridad"
    t.integer  "perfil_admin_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["perfil_admin_id"], name: "index_comunicados_on_perfil_admin_id", using: :btree
  end

  create_table "generaciones", force: :cascade do |t|
    t.string   "generacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generos", force: :cascade do |t|
    t.string "sexo"
  end

  create_table "grados", force: :cascade do |t|
    t.string "grado"
  end

  create_table "grupos", force: :cascade do |t|
    t.string  "grupo"
    t.integer "nivel_id"
    t.integer "grado_id"
    t.integer "turno_id"
    t.index ["grado_id"], name: "index_grupos_on_grado_id", using: :btree
    t.index ["nivel_id"], name: "index_grupos_on_nivel_id", using: :btree
    t.index ["turno_id"], name: "index_grupos_on_turno_id", using: :btree
  end

  create_table "materia_grupos", force: :cascade do |t|
    t.integer  "materia_id"
    t.integer  "grupo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_id"], name: "index_materia_grupos_on_grupo_id", using: :btree
    t.index ["materia_id"], name: "index_materia_grupos_on_materia_id", using: :btree
  end

  create_table "materias", force: :cascade do |t|
    t.string   "materia"
    t.integer  "nivel_id"
    t.integer  "grado_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_materias_on_color_id", using: :btree
    t.index ["grado_id"], name: "index_materias_on_grado_id", using: :btree
    t.index ["nivel_id"], name: "index_materias_on_nivel_id", using: :btree
  end

  create_table "niveles", force: :cascade do |t|
    t.string "nivel"
  end

  create_table "perfil_admins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nss"
    t.string   "ap_paterno"
    t.string   "ap_materno"
    t.string   "nombre"
    t.date     "fecha_de_nacimiento"
    t.integer  "genero_id"
    t.string   "calle"
    t.string   "numero_exterior"
    t.string   "numero_interior"
    t.string   "colonia"
    t.string   "delegacion_municipio"
    t.string   "codigo_postal"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_recados"
    t.string   "extension_recados"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["genero_id"], name: "index_perfil_admins_on_genero_id", using: :btree
    t.index ["nss"], name: "index_perfil_admins_on_nss", unique: true, using: :btree
    t.index ["user_id"], name: "index_perfil_admins_on_user_id", unique: true, using: :btree
  end

  create_table "perfil_alumnos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "matricula"
    t.string   "ap_paterno"
    t.string   "ap_materno"
    t.string   "nombre"
    t.date     "fecha_de_nacimiento"
    t.integer  "genero_id"
    t.string   "calle"
    t.string   "numero_exterior"
    t.string   "numero_interior"
    t.string   "colonia"
    t.string   "delegacion_municipio"
    t.string   "codigo_postal"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_recados"
    t.string   "extension_recados"
    t.integer  "grupo_id"
    t.integer  "generacion_id"
    t.integer  "perfil_tutor_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["generacion_id"], name: "index_perfil_alumnos_on_generacion_id", using: :btree
    t.index ["genero_id"], name: "index_perfil_alumnos_on_genero_id", using: :btree
    t.index ["grupo_id"], name: "index_perfil_alumnos_on_grupo_id", using: :btree
    t.index ["matricula"], name: "index_perfil_alumnos_on_matricula", unique: true, using: :btree
    t.index ["perfil_tutor_id"], name: "index_perfil_alumnos_on_perfil_tutor_id", using: :btree
    t.index ["user_id"], name: "index_perfil_alumnos_on_user_id", unique: true, using: :btree
  end

  create_table "perfil_profesores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nss"
    t.string   "ap_paterno"
    t.string   "ap_materno"
    t.string   "nombre"
    t.date     "fecha_de_nacimiento"
    t.integer  "genero_id"
    t.string   "calle"
    t.string   "numero_exterior"
    t.string   "numero_interior"
    t.string   "colonia"
    t.string   "delegacion_municipio"
    t.string   "codigo_postal"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_recados"
    t.string   "extension_recados"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["genero_id"], name: "index_perfil_profesores_on_genero_id", using: :btree
    t.index ["nss"], name: "index_perfil_profesores_on_nss", unique: true, using: :btree
    t.index ["user_id"], name: "index_perfil_profesores_on_user_id", unique: true, using: :btree
  end

  create_table "perfil_tutores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "ap_paterno"
    t.string   "ap_materno"
    t.string   "nombre"
    t.date     "fecha_de_nacimiento"
    t.integer  "genero_id"
    t.string   "calle"
    t.string   "numero_exterior"
    t.string   "numero_interior"
    t.string   "colonia"
    t.string   "delegacion_municipio"
    t.string   "codigo_postal"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_recados"
    t.string   "extension_recados"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["genero_id"], name: "index_perfil_tutores_on_genero_id", using: :btree
    t.index ["user_id"], name: "index_perfil_tutores_on_user_id", unique: true, using: :btree
  end

  create_table "profesor_grupos", force: :cascade do |t|
    t.integer  "perfil_profesor_id"
    t.integer  "grupo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["grupo_id"], name: "index_profesor_grupos_on_grupo_id", using: :btree
    t.index ["perfil_profesor_id"], name: "index_profesor_grupos_on_perfil_profesor_id", using: :btree
  end

  create_table "profesor_materias", force: :cascade do |t|
    t.integer  "perfil_profesor_id"
    t.integer  "materia_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["materia_id"], name: "index_profesor_materias_on_materia_id", using: :btree
    t.index ["perfil_profesor_id"], name: "index_profesor_materias_on_perfil_profesor_id", using: :btree
  end

  create_table "publicacion_grupos", force: :cascade do |t|
    t.integer  "grupo_id"
    t.integer  "publicacion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["grupo_id"], name: "index_publicacion_grupos_on_grupo_id", using: :btree
    t.index ["publicacion_id"], name: "index_publicacion_grupos_on_publicacion_id", using: :btree
  end

  create_table "publicaciones", force: :cascade do |t|
    t.string   "titulo"
    t.text     "mensaje"
    t.text     "mensaje_markdown"
    t.date     "fecha_de_termino"
    t.integer  "visitas",            default: 0
    t.integer  "perfil_profesor_id"
    t.integer  "materia_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["materia_id"], name: "index_publicaciones_on_materia_id", using: :btree
    t.index ["perfil_profesor_id"], name: "index_publicaciones_on_perfil_profesor_id", using: :btree
  end

  create_table "tipos", force: :cascade do |t|
    t.string "tipo_de_usuario"
  end

  create_table "turnos", force: :cascade do |t|
    t.string "turno"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "tipo_id"
    t.boolean  "perfilado",              default: false
    t.boolean  "menu",                   default: true
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["tipo_id"], name: "index_users_on_tipo_id", using: :btree
  end

  add_foreign_key "archivos", "publicaciones"
  add_foreign_key "comunicado_archivos", "comunicados"
  add_foreign_key "comunicado_grupos", "comunicados"
  add_foreign_key "comunicado_grupos", "grupos"
  add_foreign_key "comunicado_profesores", "comunicados"
  add_foreign_key "comunicado_profesores", "perfil_profesores"
  add_foreign_key "comunicado_tutores", "comunicados"
  add_foreign_key "comunicado_tutores", "perfil_tutores"
  add_foreign_key "comunicados", "perfil_admins"
  add_foreign_key "grupos", "grados"
  add_foreign_key "grupos", "niveles"
  add_foreign_key "grupos", "turnos"
  add_foreign_key "materia_grupos", "grupos"
  add_foreign_key "materia_grupos", "materias"
  add_foreign_key "materias", "colores"
  add_foreign_key "materias", "grados"
  add_foreign_key "materias", "niveles"
  add_foreign_key "perfil_admins", "generos"
  add_foreign_key "perfil_admins", "users"
  add_foreign_key "perfil_alumnos", "generaciones"
  add_foreign_key "perfil_alumnos", "generos"
  add_foreign_key "perfil_alumnos", "grupos"
  add_foreign_key "perfil_alumnos", "perfil_tutores"
  add_foreign_key "perfil_alumnos", "users"
  add_foreign_key "perfil_profesores", "generos"
  add_foreign_key "perfil_profesores", "users"
  add_foreign_key "perfil_tutores", "generos"
  add_foreign_key "perfil_tutores", "users"
  add_foreign_key "profesor_grupos", "grupos"
  add_foreign_key "profesor_grupos", "perfil_profesores"
  add_foreign_key "profesor_materias", "materias"
  add_foreign_key "profesor_materias", "perfil_profesores"
  add_foreign_key "publicacion_grupos", "grupos"
  add_foreign_key "publicacion_grupos", "publicaciones"
  add_foreign_key "publicaciones", "materias"
  add_foreign_key "publicaciones", "perfil_profesores"
end
