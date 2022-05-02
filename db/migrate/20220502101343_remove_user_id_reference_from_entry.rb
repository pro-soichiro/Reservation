class RemoveUserIdReferenceFromEntry < ActiveRecord::Migration[5.2]
  def change
    remove_reference :entries,:user_id
  end
end
