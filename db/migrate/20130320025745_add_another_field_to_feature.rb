class AddAnotherFieldToFeature < ActiveRecord::Migration
  def change
    add_column :features, :highlighted_post, :boolean
  end
end
