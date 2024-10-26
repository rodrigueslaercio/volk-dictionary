require "httparty"

class DeepL
  def self.api(text)
    key = ENV["DEEPL"]

    response = HTTParty.post(
      "https://api-free.deepl.com/v2/translate",
      headers: {
        "Authorization" => "DeepL-Auth-Key #{key}",
        "Content-Type" => "application/json"
      },
      body: {
        text: [ text ],
        target_lang: "EN"
      }.to_json
    )

    JSON.parse(response.body)
  end
end
