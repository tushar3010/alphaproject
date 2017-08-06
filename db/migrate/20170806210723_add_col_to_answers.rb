class AddColToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers,:content,:string 
  	add_reference :answers, :question, index: true
  end
end
