class Question < ApplicationRecord
  belongs_to :question_paper
  has_many :user_answers

  validates_presence_of :query, :option_1, :option_2, :option_3, :option_4, :correct_option

  def selected_option user
    selection = user_answers.where(user: user).first
    if selection
      return selection.selected_option
    else
      return nil
    end
  end
end
