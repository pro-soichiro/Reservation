class RemoveUserNameFromEntry < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :user_name
  end
end
