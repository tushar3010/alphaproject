module HomeHelper
	def is_question_upvoted q_id
		q = Question.find(q_id)
		upvote = q.upvotes.where(:user_id => current_user.id).count>0 
	end
	
	def is_answer_upvoted q_id
		a = Answer.find(q_id)
		upvote = a.upvotes.where(:user_id => current_user.id).count>0 
	end	
end
