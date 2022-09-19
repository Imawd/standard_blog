class AddReferenceToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author
  end
end
