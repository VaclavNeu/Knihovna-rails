class AddReturnedAtToLoans < ActiveRecord::Migration[8.1]
  def change
    add_column :loans, :returned_at, :datetime
  end
end
