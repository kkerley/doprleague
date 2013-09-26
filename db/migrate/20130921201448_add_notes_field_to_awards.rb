class AddNotesFieldToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :notes, :string
  end
end
