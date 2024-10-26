require "httparty"
require "cgi"

class Tatoeba 
  def self.api(text)
    encoded_text = CGI.escape(text)
    response = HTTParty.get("https://api.dev.tatoeba.org/unstable/sentences?lang=rus&q=#{encoded_text}&trans=eng")
    JSON.parse(response.body)
  end
end
