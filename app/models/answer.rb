class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  has_many :upvotes, :as=>:upvotable
  #has_many :upvotes, as: :type
  #validates :answer, presence: true, length: {maximum: 300}

end
