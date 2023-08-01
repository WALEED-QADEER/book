class RemoveColumnNameFromTableName < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :author_id, :bigint
  end
end
