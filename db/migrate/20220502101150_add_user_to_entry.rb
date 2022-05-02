class AddUserToEntry < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :user
  end
end
