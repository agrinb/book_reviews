class AddContraintsToDb < ActiveRecord::Migration
  def change


   change_column :books, :title, :string, null: false
   change_column :books, :author, :string, null: false
   change_column :books, :year, :integer, null: false


  end
end
