class AddBodyToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :body, :string
  end
end
