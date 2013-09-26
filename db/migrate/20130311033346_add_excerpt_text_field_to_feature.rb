class AddExcerptTextFieldToFeature < ActiveRecord::Migration
  def change
    add_column :features, :excerpt, :text
  end
end
