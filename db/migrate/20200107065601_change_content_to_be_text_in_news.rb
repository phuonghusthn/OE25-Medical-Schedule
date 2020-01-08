class ChangeContentToBeTextInNews < ActiveRecord::Migration[6.0]
  def change
    change_column :news, :content, :text
  end
end
