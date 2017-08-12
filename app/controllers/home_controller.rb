class HomeController < ApplicationController

	before_action :authenticate_user!

	def index
		@questions = Question.includes(:answers).all
	end

	def ques
		content = params[:content]
		current_user.questions.create(:content => content)
		redirect_to '/'
	end

	def ans
		answer = params[:answer]
		ques = current_user.questions.find(params[:ques])
		ques.answers.create(:answer => answer)
		redirect_to '/'
	end

	def all_users
		@users = User.all

	end

	def toggle_question_upvote
		@question = Question.find(params[:id])
		upvote = @question.upvotes.where(:user_id => current_user.id).first

		if upvote.nil?
			@question.upvotes.create(:user_id => current_user.id)
		else
			upvote.destroy
		end

		respond_to do |format|
			format.js{

			}
		end

	end

	def toggle_answer_upvote
		@answer = Answer.find(params[:id])
		upvote = @answer.upvotes.where(:user_id => current_user.id).first

		if upvote.nil?
			@answer.upvotes.create(:user_id => current_user.id)
		else
			upvote.destroy
		end

		respond_to do |format|
			format.js{

			}
		end

	end


	def answer
		@question = Question.find(params[:id])
		@ans = @question.answers.create(:user_id => current_user.id,:content => params[:content])
		respond_to do |format|
			format.js{

			}
		end
	end


	
end
