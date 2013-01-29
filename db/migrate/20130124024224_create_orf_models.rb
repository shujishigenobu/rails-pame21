class CreateOrfModels < ActiveRecord::Migration
  def change
    create_table :orf_models do |t|
      t.string :name
      t.string :description
      t.text :naseq
      t.text :aaseq

      t.timestamps
    end
    add_index :orf_models, :name, :unique => true
  end
end
