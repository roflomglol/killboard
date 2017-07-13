module Fetchers
  class BaseFetcher
    class_attribute :host, :path

    self.host = 'https://api.eveonline.com'.freeze

    attr_accessor :res

    def call
      self.res = ::Net::HTTP.get_response(uri)
    end

    private

    def uri
      uri       = URI(url)
      uri.query = URI.encode_www_form(params)}

      uri
    end

    def url
      self.class.host + self.class.path
    end

    def params
      {
        keyID: ENV.fetch('EVE_API_KEY_ID'),
        vCode: ENV.fetch('EVE_API_V_CODE')
      }
    end
  end
end
