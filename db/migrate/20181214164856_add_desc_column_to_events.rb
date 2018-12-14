class AddDescColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :desc, :string
  end
end
