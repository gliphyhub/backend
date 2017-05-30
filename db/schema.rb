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

ActiveRecord::Schema.define(version: 20170530131744) do

  create_table "admin_archivos", force: :cascade do |t|
    t.integer  "admin_publicacion_id"
    t.string   "nombre"
    t.string   "ruta"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["admin_publicacion_id"], name: "index_admin_archivos_on_admin_publicacion_id"
  end

  create_table "admin_publicaciones", force: :cascade do |t|
    t.string   "titulo"
    t.text     "mensaje"
    t.text     "mensaje_markdown"
    t.date     "fecha_de_termino"
    t.boolean  "prioridad"
    t.integer  "perfil_admin_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["perfil_admin_id"], name: "index_admin_publicaciones_on_perfil_admin_id"
  end

  create_table "archivos", force: :cascade do |t|
    t.integer  "publicacion_id"
    t.string   "nombre"
    t.string   "ruta"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publicacion_id"], name: "index_archivos_on_publicacion_id"
  end

  create_table "colores", force: :cascade do |t|
    t.string   "color"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "grupo"
    t.integer  "nivel_id"
    t.integer  "grado_id"
    t.integer  "turno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grado_id"], name: "index_grupos_on_grado_id"
    t.index ["nivel_id"], name: "index_grupos_on_nivel_id"
    t.index ["turno_id"], name: "index_grupos_on_turno_id"
  end

  create_table "materia_grupos", force: :cascade do |t|
    t.integer  "materia_id"
    t.integer  "grupo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_id"], name: "index_materia_grupos_on_grupo_id"
    t.index ["materia_id"], name: "index_materia_grupos_on_materia_id"
  end

  create_table "materias", force: :cascade do |t|
    t.string   "materia"
    t.integer  "nivel_id"
    t.integer  "grado_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_materias_on_color_id"
    t.index ["grado_id"], name: "index_materias_on_grado_id"
    t.index ["nivel_id"], name: "index_materias_on_nivel_id"
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
    t.index ["genero_id"], name: "index_perfil_admins_on_genero_id"
    t.index ["nss"], name: "index_perfil_admins_on_nss", unique: true
    t.index ["user_id"], name: "index_perfil_admins_on_user_id", unique: true
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
    t.index ["generacion_id"], name: "index_perfil_alumnos_on_generacion_id"
    t.index ["genero_id"], name: "index_perfil_alumnos_on_genero_id"
    t.index ["grupo_id"], name: "index_perfil_alumnos_on_grupo_id"
    t.index ["matricula"], name: "index_perfil_alumnos_on_matricula", unique: true
    t.index ["perfil_tutor_id"], name: "index_perfil_alumnos_on_perfil_tutor_id"
    t.index ["user_id"], name: "index_perfil_alumnos_on_user_id", unique: true
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
    t.index ["genero_id"], name: "index_perfil_profesores_on_genero_id"
    t.index ["nss"], name: "index_perfil_profesores_on_nss", unique: true
    t.index ["user_id"], name: "index_perfil_profesores_on_user_id", unique: true
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
    t.index ["genero_id"], name: "index_perfil_tutores_on_genero_id"
    t.index ["user_id"], name: "index_perfil_tutores_on_user_id", unique: true
  end

  create_table "profesor_grupos", force: :cascade do |t|
    t.integer  "perfil_profesor_id"
    t.integer  "grupo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["grupo_id"], name: "index_profesor_grupos_on_grupo_id"
    t.index ["perfil_profesor_id"], name: "index_profesor_grupos_on_perfil_profesor_id"
  end

  create_table "profesor_materias", force: :cascade do |t|
    t.integer  "perfil_profesor_id"
    t.integer  "materia_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["materia_id"], name: "index_profesor_materias_on_materia_id"
    t.index ["perfil_profesor_id"], name: "index_profesor_materias_on_perfil_profesor_id"
  end

  create_table "profesor_publicaciones", force: :cascade do |t|
    t.integer  "publicacion_id"
    t.integer  "perfil_profesor_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["perfil_profesor_id"], name: "index_profesor_publicaciones_on_perfil_profesor_id"
    t.index ["publicacion_id"], name: "index_profesor_publicaciones_on_publicacion_id"
  end

  create_table "publicacion_grupos", force: :cascade do |t|
    t.integer  "grupo_id"
    t.integer  "publicacion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["grupo_id"], name: "index_publicacion_grupos_on_grupo_id"
    t.index ["publicacion_id"], name: "index_publicacion_grupos_on_publicacion_id"
  end

  create_table "publicaciones", force: :cascade do |t|
    t.string   "titulo"
    t.text     "mensaje"
    t.text     "mensaje_markdown"
    t.date     "fecha_de_termino"
    t.boolean  "prioridad"
    t.integer  "perfil_profesor_id"
    t.integer  "materia_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["materia_id"], name: "index_publicaciones_on_materia_id"
    t.index ["perfil_profesor_id"], name: "index_publicaciones_on_perfil_profesor_id"
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
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tipo_id"], name: "index_users_on_tipo_id"
  end

end
