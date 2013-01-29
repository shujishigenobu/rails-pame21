class CreateBlastNrTopHits < ActiveRecord::Migration
  def change
    create_table :blast_nr_top_hits do |t|
      t.string :query
      t.string :name
      t.integer :len_align
      t.float :evalue
      t.float :bitscore
      t.text :description
      t.integer :taxid
      t.string :species
      t.string :common_name
      t.text :taxonomy
      t.integer :orf_model_id

      t.timestamps
    end
    add_index :blast_nr_top_hits, :query, :unique => true
    add_index :blast_nr_top_hits, :orf_model_id, :unique => true
  end
end
