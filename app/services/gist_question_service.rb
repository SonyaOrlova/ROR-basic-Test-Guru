class GistQuestionService
  attr_reader :client

  def initialize(question, client=default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = Result.new

    begin
      response = @client.create_gist(gist_params)
      
      result.set_response(response)
    rescue
    end

    result
  end

  private

  def default_client
    Octokit::Client.new(access_token: 'ae09f2ba216833de2aa665f0a09461229f595466')
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_params.description', test_title: @test.title),
      files: {
        "#{@question.id}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << @question.answers.pluck(:body)
    content.join("\n")
  end

  class Result
    attr_reader :response

    def set_response(response)
      @response = response
    end

    def success?
      !!@response&.id
    end
  end
end
