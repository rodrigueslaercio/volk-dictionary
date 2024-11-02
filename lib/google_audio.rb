require "httparty"
require "cgi"

class GoogleAudio
  def self.audio(text)
    encoded_text = CGI.escape(text)
    response = HTTParty.get("https://translate.google.com.vn/translate_tts?ie=UTF-8&q=#{encoded_text}&tl=ru&client=tw-ob")
  
    if response.success?
      response.body
    end
  end
end
