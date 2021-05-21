module GistsHelper
  include Rails.application.routes.url_helpers
  def test_link(gist)
    question = gist.question
    link_to question.test.title.truncate(25), admin_question_path(question)
  end

  def gist_url(gist)
    link_to gist.url.split('/').last, gist.url
  end

  def user_email(gist)
    gist.user.email
  end
end
