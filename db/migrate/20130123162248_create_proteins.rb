class CreateProteins < ActiveRecord::Migration
  def change
    create_table :proteins do |t|
      t.string :name
      t.string :desc
      t.text :seq

      t.timestamps
    end
    add_index :proteins, :name, :unique => true
    
  end
end
