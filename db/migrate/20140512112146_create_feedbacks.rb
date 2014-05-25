class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
	t.string :number
	t.text :content
      t.timestamps
    end
  end
end
