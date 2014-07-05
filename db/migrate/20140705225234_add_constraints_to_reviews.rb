class AddConstraintsToReviews < ActiveRecord::Migration
  def change

   change_column :reviews, :description, :string, null: false
   change_column :reviews, :book_id, :integer, null: false
   change_column :reviews, :rating, :integer, null: false

  end
end
