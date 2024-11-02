require "httparty"
require "cgi"

class YandexDictionary
  def self.api(text)
    key = ENV["YANDEX"]
    encoded_text = CGI.escape(text)

    response = HTTParty.get("https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=#{key}&lang=ru-en&text=#{encoded_text}")

    if response.success?
      JSON.parse(response.body)
    end
  end
end
