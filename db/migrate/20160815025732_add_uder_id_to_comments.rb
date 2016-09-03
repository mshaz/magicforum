class AddUderIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :User_Id, :integer
  end
end
