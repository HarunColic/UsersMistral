class CreateUserPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_permissions do |t|
      t.integer :user_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
