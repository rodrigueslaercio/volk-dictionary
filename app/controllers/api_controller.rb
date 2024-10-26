class ApiController < ApplicationController
  require "httparty"

  def index
  end

  def create
    response = DeepL.api(params[:input_text])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("result", partial: "result", locals: { result: response })
      end
    end
  end
end
