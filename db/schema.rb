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

ActiveRecord::Schema.define(version: 2018_10_29_192841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contatos", force: :cascade do |t|
    t.bigint "departamento_id"
    t.string "nome"
    t.string "telefone", limit: 10
    t.string "celular", limit: 11
    t.string "cargo"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_contatos_on_departamento_id"
  end

  create_table "departamentos", force: :cascade do |t|
    t.bigint "local_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_id"], name: "index_departamentos_on_local_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.bigint "local_id"
    t.string "cep", limit: 8
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_id"], name: "index_enderecos_on_local_id"
  end

  create_table "locais", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "login", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "acesso", default: 2, null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_usuarios_on_login", unique: true
  end

  add_foreign_key "contatos", "departamentos"
  add_foreign_key "departamentos", "locais"
  add_foreign_key "enderecos", "locais"
end
