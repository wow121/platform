class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
	t.string :name
	t.string :password
	t.string :number
	t.string :grade
	t.string :token
	t.string :myclass

      t.timestamps
    end
  end
end
