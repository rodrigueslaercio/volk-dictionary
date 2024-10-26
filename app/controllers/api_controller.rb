require "httparty"

class ApiController < ApplicationController
  def index
  end

  def create
    deepl_response = DeepL.api(params[:input_text])
    audio_response = GoogleAudio.audio(params[:input_text])

    if params[:input_text].to_s.split.size == 1
      yandex_response = YandexDictionary.api(params[:input_text])

      response = {
        deepL: deepl_response,
        yandex: yandex_response,
        audio: audio_response
      }
    else
      response = {
        deepL: deepl_response,
        audio: audio_response
      }
    end

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.update("result", partial: "result", locals: { result: response })
      }
    end
  end
end
