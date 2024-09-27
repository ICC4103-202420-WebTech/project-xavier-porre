# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_27_132003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clases", force: :cascade do |t|
    t.text "texto"
    t.string "imagen"
    t.string "video"
    t.bigint "curso_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_clases_on_curso_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nombre"
    t.bigint "creador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creador_id"], name: "index_cursos_on_creador_id"
  end

  create_table "cursos_usuarios", force: :cascade do |t|
    t.bigint "curso_id", null: false
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_cursos_usuarios_on_curso_id"
    t.index ["usuario_id"], name: "index_cursos_usuarios_on_usuario_id"
  end

  create_table "pregunta", force: :cascade do |t|
    t.text "texto"
    t.bigint "usuario_id", null: false
    t.bigint "clase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clase_id"], name: "index_pregunta_on_clase_id"
    t.index ["usuario_id"], name: "index_pregunta_on_usuario_id"
  end

  create_table "respuesta", force: :cascade do |t|
    t.text "texto"
    t.bigint "usuario_id", null: false
    t.bigint "pregunta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pregunta_id"], name: "index_respuesta_on_pregunta_id"
    t.index ["usuario_id"], name: "index_respuesta_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre_completo"
    t.string "rut"
    t.string "contraseña_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo_u"
  end

  add_foreign_key "clases", "cursos"
  add_foreign_key "cursos", "usuarios", column: "creador_id"
  add_foreign_key "cursos_usuarios", "cursos"
  add_foreign_key "cursos_usuarios", "usuarios"
  add_foreign_key "pregunta", "clases"
  add_foreign_key "pregunta", "usuarios"
  add_foreign_key "respuesta", "pregunta", column: "pregunta_id"
  add_foreign_key "respuesta", "usuarios"
end
