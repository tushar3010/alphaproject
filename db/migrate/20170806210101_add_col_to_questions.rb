class AddColToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions,:content,:string 
  	add_reference :questions, :user, index: true 
  end
end
