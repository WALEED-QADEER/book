class RenameauthorTopage < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :author, :pages
  end
end
