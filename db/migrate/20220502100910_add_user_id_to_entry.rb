class AddUserIdToEntry < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :user_id
  end
end
