class AddRestToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :reset_digest, :string       # fixed typo here
    add_column :users, :reset_sent_at, :datetime    # and here
  end
end
