class AddAttachmentPictureToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :pages, :picture
  end
end
