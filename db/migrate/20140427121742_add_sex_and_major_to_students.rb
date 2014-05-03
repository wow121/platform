class AddSexAndMajorToStudents < ActiveRecord::Migration
  def change
    add_column :students, :sex, :string
    add_column :students, :major, :string
  end
end
