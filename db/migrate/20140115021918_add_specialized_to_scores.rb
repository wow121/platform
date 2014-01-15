class AddSpecializedToScores < ActiveRecord::Migration
  def change
    add_column :scores, :specialized, :string
  end
end
