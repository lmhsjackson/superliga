class AddLastNameToPlayer < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :name, :first_name
    add_column :players, :last_name, :string
  end
end
