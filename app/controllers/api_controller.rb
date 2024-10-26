require "httparty"

class ApiController < ApplicationController 
  def index
  end

  def create
  if params[:input_text].to_s.split.size == 1
    deepl_response = DeepL.api(params[:input_text])
    yandex_response = YandexDictionary.api(params[:input_text])

    response = {
      deepL: deepl_response,
      yandex: yandex_response
    }
  else
    deepl_response = DeepL.api(params[:input_text])
    response = {
      deepL: deepl_response
    }
  end

    respond_to do |format|
    format.turbo_stream {
        render turbo_stream: turbo_stream.replace("result", partial: "result", locals: { result: response })
    }
    end
  end
end
