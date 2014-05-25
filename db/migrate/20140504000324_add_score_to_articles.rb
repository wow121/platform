class AddScoreToArticles < ActiveRecord::Migration
  def change
    add_column :scores, :score, :string
  end
end
