class RenameBodyColumnToImagemodel2s < ActiveRecord::Migration[5.2]
  def change
  	rename_column :imagemodel2s, :body, :boddy
  end
end
