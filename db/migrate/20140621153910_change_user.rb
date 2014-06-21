class ChangeUser < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.boolean :retweeted
    end
  end
end
