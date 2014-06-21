class ChangeUser < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.boolean :retweeted
      t.integer :retweeter_id
    end
  end
end
