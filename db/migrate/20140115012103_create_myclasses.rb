class CreateMyclasses < ActiveRecord::Migration
  def change
    create_table :myclasses do |t|
	t.string :name
	t.string :count
	t.string :teachermanage
	t.string :grade
      t.timestamps
    end
  end
end
