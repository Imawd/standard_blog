class AddUsernameToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :username, :string
  end
end
