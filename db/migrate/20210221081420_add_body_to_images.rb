class AddBodyToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :body, :string
  end
end
