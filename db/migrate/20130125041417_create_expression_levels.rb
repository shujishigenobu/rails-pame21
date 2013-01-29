class CreateExpressionLevels < ActiveRecord::Migration
  def change
    create_table :expression_levels do |t|
      t.string :name
      t.float :idx10
      t.float :idx11
      t.float :idx12
      t.float :idx7
      t.float :idx8
      t.float :idx9

      t.integer :orf_model_id

      t.timestamps
    end
    add_index :expression_levels, :name, :unique => true
    add_index :expression_levels, :orf_model_id, :unique => true
  end
end
