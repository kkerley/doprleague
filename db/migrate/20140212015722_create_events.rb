class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :team_id
      t.string :title
      t.date :event_date
      t.string :event_type, :default => "Personal"
      t.text :description

      t.timestamps
    end
  end
end
