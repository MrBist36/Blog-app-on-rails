class AddColumnsToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :full_name, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :address, :string
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :user_id, :integer
    add_index :profiles, :user_id
    add_column :profiles, :organization_id, :integer
    add_index :profiles, :organization_id
  end
end
