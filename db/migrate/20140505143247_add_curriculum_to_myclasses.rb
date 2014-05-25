class AddCurriculumToMyclasses < ActiveRecord::Migration
  def change
    add_column :myclasses, :curriculum, :string
  end
end
