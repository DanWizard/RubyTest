class AddCreatorColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :creator, :integer
  end
end
