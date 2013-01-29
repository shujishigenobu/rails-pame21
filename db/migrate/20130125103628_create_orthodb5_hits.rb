class CreateOrthodb5Hits < ActiveRecord::Migration
  def change
    create_table :orthodb5_hits do |t|
      t.string :name
      t.string :orthgrp
      t.string :besthit
      t.text   :blast_record
      t.integer :orf_model_id

      t.timestamps
    end
    add_index :orthodb5_hits, :name, :unique => true
    add_index :orthodb5_hits, :orthgrp
    add_index :orthodb5_hits, :orf_model_id, :unique => true
  end
end
