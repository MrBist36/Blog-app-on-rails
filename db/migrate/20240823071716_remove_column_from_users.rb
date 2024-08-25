class RemoveColumnFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :organization_id, :string
  end
end
