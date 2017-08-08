module HomeHelper
	def is_question_upvoted q_id
		q = Question.find(q_id)
		upvote = q.upvotes.count>0 
	end
end
