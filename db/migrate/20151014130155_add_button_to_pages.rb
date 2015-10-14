class AddButtonToPages < ActiveRecord::Migration
  def change
    add_column :pages, :btn, :string
    add_column :pages, :btn_style, :string
  end
end
