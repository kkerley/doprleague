class AddAttachmentAvatarToFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :features, :avatar
  end
end
