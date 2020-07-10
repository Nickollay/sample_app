class QuestionsController < ApplicationController



  def index
    @questions = Question.all.order(created_at: :asc)
    bodies =@questions.map do |q|
      q.body
    end
    render plain: "#{bodies * "\n"}"
  end
  #
  # Просмотра конкретного вопроса теста
  def show
    @question = Question.find(params[:id])
    render plain: @question.body
  end
  # Создания вопроса. Используйте шаблон с HTML формой.
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @test = @question.test
    if @question.save
      # redirect_to test_question_path(@test, @question)
      redirect_to action: :show
    else
      render action: :new, flash: {alert: 'Some error occured.'}

    end

  end
  #     Идентификатор теста к которому принадлежит вопрос можно указать явно
  # в составе URL значения атрибута action в тэге form
  # Удаления вопроса
  #
  # Используйте метод render внутри действия контроллера
  #
  # чтобы вернуть ответ клиенту как простой текст (plain text) или HTML
  # Используйте обратный вызов при поиске теста в контроллере ресурса вопросов


  # 3. Напишите обработку исключения для случая когда вопрос не был найден
  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

end
