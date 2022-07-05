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

ActiveRecord::Schema[7.0].define(version: 2022_06_08_081819) do
  create_table "juega_individuals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.integer "puntuacion"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_juega_individuals_on_usuario_id"
  end

  create_table "participas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "torneo_id", null: false
    t.bigint "usuario_id", null: false
    t.integer "puntuacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha"
    t.index ["torneo_id"], name: "index_participas_on_torneo_id"
    t.index ["usuario_id"], name: "index_participas_on_usuario_id"
  end

  create_table "partidas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "puntuacion"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "torneos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha_max_juego"
    t.boolean "es_bomba"
    t.float "multiplier"
    t.integer "piezas_puestas"
    t.string "descripcion", limit: 1500
    t.float "probabilidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "contrasena"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nombre"], name: "nombre", unique: true
  end

  add_foreign_key "juega_individuals", "usuarios"
  add_foreign_key "participas", "torneos"
  add_foreign_key "participas", "usuarios"
end
