class CreateSpecializeds < ActiveRecord::Migration
  def change
    create_table :specializeds do |t|
	t.string :name
	t.string :teacher
	t.text :intro
	t.string :period
	t.string :location
      t.timestamps
    end
  end
end
