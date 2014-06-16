class CreateUsersUsers < ActiveRecord::Migration
  def change
    create_table :users_users do |t|
      t.integer :reader_id
      t.integer :writer_id
    end
  end
end
