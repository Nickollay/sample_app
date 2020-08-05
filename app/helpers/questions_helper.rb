module QuestionsHelper
  def question_header(test, question)

    return "Edit #{question.test.title} Question" if !test

    "New #{test.title} Question"
  end
end
