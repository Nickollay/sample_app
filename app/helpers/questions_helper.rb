module QuestionsHelper
  def question_header(question)

    return "Edit #{question.test.title} Question" if question.persisted?

    "New #{question.test.title} Question"
  end
end
