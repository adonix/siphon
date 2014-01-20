class AddAttachmentNameToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :name
    end
  end

  def self.down
    drop_attached_file :videos, :name
  end
end
