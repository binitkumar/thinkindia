class QuestionPaper < ApplicationRecord
  has_attached_file :question_file
  validates_attachment_content_type :question_file, :content_type => [
                                          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                                          'application/zip',
                                          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                          'application/vnd.ms-excel',
                                          'application/xls',
                                          'application/xlsx',
                                          'application/octet-stream'
                                        ]

  has_many :questions
  has_many :paper_results

  after_create :load_questions

  def generate_summary(user_id)
    user = User.find user_id
    answers = self.questions.collect(&:user_answers).flatten & user.user_answers

    @correct_answers = 0
    @wrong_answers = 0
    answers.each do |ans|
      if ans.selected_option == ans.question.correct_option
        @correct_answers += 1
      else
        @wrong_answers += 1
      end 
    end
    result = PaperResult.where(
      user_id: user_id,
      question_paper_id: self.id
    ).first

    if result
      result.update_attributes(correct_answer: @correct_answers, wrong_answer: @wrong_answers)
    else
      PaperResult.create(
        user_id: user_id,
        question_paper_id: self.id,
        correct_answer: @correct_answers, 
        wrong_answer: @wrong_answers
      )
    end
  end

  def load_questions
   open(File.join(Rails.root, "tmp", self.question_file_file_name), 'wb') do |file|
     file << self.question_file.queued_for_write[:original].read
   end
   
    xlsx = Roo::Spreadsheet.open(File.join(Rails.root, "tmp", self.question_file_file_name), extension: :xlsx )

    sheet = xlsx.sheet(0)
    index = 0 
    sheet.each do |hash|
      Question.create(
        query: hash[0], 
        option_1: hash[1], 
        option_2: hash[2], 
        option_3: hash[3], 
        option_4: hash[4], 
        correct_option: hash[5],
        question_paper_id: self.id,
        index: index
      )
      index = index + 1
    end
  end
end
