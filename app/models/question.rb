class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :upvotes, :as=>:upvotable
    validates :content, presence: true, length: {maximum: 800}

end
