class AddOrganizationRefToArticles < ActiveRecord::Migration[7.2]
  def change
    add_reference :articles, :organization, null: false, default: 1, foreign_key: true
  end
end
