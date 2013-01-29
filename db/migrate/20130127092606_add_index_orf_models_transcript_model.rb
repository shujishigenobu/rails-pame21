class AddIndexOrfModelsTranscriptModel < ActiveRecord::Migration
  def up
    add_column :orf_models, :transcript_model_id, :integer
    add_index :orf_models, :transcript_model_id
  end

  def down
    remove_column :orf_models, :transcript_model_id
  end
end
