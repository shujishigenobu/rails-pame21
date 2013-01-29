# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130127092606) do

  create_table "blast_nr_results", :force => true do |t|
    t.string  "q_seqid"
    t.string  "s_seqid"
    t.float   "pident"
    t.integer "alen"
    t.integer "mismatch"
    t.integer "gapopen"
    t.integer "q_start"
    t.integer "q_end"
    t.integer "s_start"
    t.integer "s_end"
    t.float   "evalue"
    t.float   "bitscore"
    t.integer "q_len"
    t.integer "s_len"
    t.text    "description"
    t.integer "taxid"
    t.string  "species"
    t.string  "common_name"
    t.integer "orf_model_id"
  end

  add_index "blast_nr_results", ["orf_model_id"], :name => "index_blast_nr_results_on_orf_model_id"
  add_index "blast_nr_results", ["q_seqid"], :name => "index_blast_nr_results_on_q_seqid"

  create_table "blast_nr_top_hits", :force => true do |t|
    t.string   "query"
    t.string   "name"
    t.integer  "len_align"
    t.float    "evalue"
    t.float    "bitscore"
    t.text     "description"
    t.integer  "taxid"
    t.string   "species"
    t.string   "common_name"
    t.text     "taxonomy"
    t.integer  "orf_model_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "blast_nr_top_hits", ["orf_model_id"], :name => "index_blast_nr_top_hits_on_orf_model_id", :unique => true
  add_index "blast_nr_top_hits", ["query"], :name => "index_blast_nr_top_hits_on_query", :unique => true

  create_table "blast_termite454_results", :force => true do |t|
    t.string  "q_seqid"
    t.string  "s_seqid"
    t.float   "pident"
    t.integer "alen"
    t.integer "mismatch"
    t.integer "gapopen"
    t.integer "q_start"
    t.integer "q_end"
    t.integer "s_start"
    t.integer "s_end"
    t.float   "evalue"
    t.float   "bitscore"
    t.integer "q_len"
    t.integer "s_len"
    t.text    "description"
    t.integer "taxid"
    t.string  "species"
    t.string  "common_name"
    t.integer "orf_model_id"
  end

  add_index "blast_termite454_results", ["orf_model_id"], :name => "index_blast_termite454_results_on_orf_model_id"
  add_index "blast_termite454_results", ["q_seqid"], :name => "index_blast_termite454_results_on_q_seqid"

  create_table "expression_levels", :force => true do |t|
    t.string   "name"
    t.float    "idx10"
    t.float    "idx11"
    t.float    "idx12"
    t.float    "idx7"
    t.float    "idx8"
    t.float    "idx9"
    t.integer  "orf_model_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "expression_levels", ["name"], :name => "index_expression_levels_on_name", :unique => true
  add_index "expression_levels", ["orf_model_id"], :name => "index_expression_levels_on_orf_model_id", :unique => true

  create_table "interpro_motifs", :force => true do |t|
    t.string   "name"
    t.string   "md5"
    t.integer  "length"
    t.string   "analysis"
    t.string   "signature_acc"
    t.string   "signature_desc"
    t.integer  "start"
    t.integer  "stop"
    t.float    "score"
    t.string   "status"
    t.date     "date"
    t.string   "interpro_acc"
    t.string   "interpro_desc"
    t.string   "interpro_go"
    t.integer  "orf_model_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "interpro_motifs", ["interpro_acc"], :name => "index_interpro_motifs_on_interpro_acc"
  add_index "interpro_motifs", ["name"], :name => "index_interpro_motifs_on_name"
  add_index "interpro_motifs", ["orf_model_id"], :name => "index_interpro_motifs_on_orf_model_id"
  add_index "interpro_motifs", ["signature_acc"], :name => "index_interpro_motifs_on_signature_acc"

  create_table "orf_models", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "naseq"
    t.text     "aaseq"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "transcript_model_id"
  end

  add_index "orf_models", ["name"], :name => "index_orf_models_on_name", :unique => true
  add_index "orf_models", ["transcript_model_id"], :name => "index_orf_models_on_transcript_model_id"

  create_table "orthodb5_hits", :force => true do |t|
    t.string   "name"
    t.string   "orthgrp"
    t.string   "besthit"
    t.text     "blast_record"
    t.integer  "orf_model_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "orthodb5_hits", ["name"], :name => "index_orthodb5_hits_on_name", :unique => true
  add_index "orthodb5_hits", ["orf_model_id"], :name => "index_orthodb5_hits_on_orf_model_id", :unique => true
  add_index "orthodb5_hits", ["orthgrp"], :name => "index_orthodb5_hits_on_orthgrp"

  create_table "proteins", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.text     "seq"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "proteins", ["name"], :name => "index_proteins_on_name", :unique => true

  create_table "transcript_models", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.text    "seq"
    t.integer "len"
  end

  add_index "transcript_models", ["name"], :name => "index_transcript_models_on_name", :unique => true

end
