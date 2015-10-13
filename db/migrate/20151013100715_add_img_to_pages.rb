class AddImgToPages < ActiveRecord::Migration
  def change
    add_column :pages, :imgurl, :string
  end
end
