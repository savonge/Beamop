class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.string :headline
      t.string :content

      t.timestamps null: false
    end
  end
end
