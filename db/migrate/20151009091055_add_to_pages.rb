class AddToPages < ActiveRecord::Migration
  def change
    add_column :pages, :headline_style, :text
    add_column :pages, :content_style, :text
    add_column :pages, :bg_style, :text
    add_column :pages, :published, :boolean

  end
end
