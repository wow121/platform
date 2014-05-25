class AddTimeToSpecializeds < ActiveRecord::Migration
  def change
    add_column :specializeds, :time, :string
  end
end
