class RemoveBookIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :book_id, :string
  end
end
