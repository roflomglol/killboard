require 'net/http'

module Fetchers
  class BaseFetcher
    class_attribute :host, :path

    self.host = 'https://api.eveonline.com'.freeze

    attr_accessor :res, :xml

    def call
      self.res = ::Net::HTTP.get_response(uri)
      self.xml = res.body

      self
    end

    private

    def uri
      uri       = URI(url)
      uri.query = URI.encode_www_form(params)

      uri
    end

    def url
      self.class.host + self.class.path
    end

    def params
      fail NotImplementedError
    end
  end
end
