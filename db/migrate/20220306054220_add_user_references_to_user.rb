class AddUserReferencesToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :teacher, foreign_key: { to_table: :users }
  end
end
