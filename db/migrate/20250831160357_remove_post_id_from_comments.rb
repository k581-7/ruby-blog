class RemovePostIdFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_reference :comments, :post, null: false, foreign_key: true
  end
end
