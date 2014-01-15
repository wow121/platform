class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
	t.string :name
	t.string :number
      t.timestamps
    end
  end
end
