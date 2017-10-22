class AddKidToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :kid, foreign_key: true
  end
end
