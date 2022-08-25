class ChangePostscountColumnDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :postscount, 0
  end
end
