module Authograph::Adapters
  class Faraday < Base
    def initialize(_request)
      @request = _request
    end

    def get_header(_header)
      @request.headers[_header]
    end

    def set_header(_header, _value)
      @request.headers[_header] = _value
    end

    def method
      @request.method.to_s.upcase
    end

    def path
      uri = URI(@request.path)
      uri.query = ::Faraday::Utils.build_query(@request.params) unless @request.params.empty?
      uri.request_uri
    end

    def content_type
      @request.headers['Content-Type'] || 'application/x-www-form-urlencoded'
    end

    def body
      @request.body
    end
  end
end
