require_relative 'concerns/http_error'
class HttpClient
  
  def self.get(url: required, options: nil, headers: nil)
    headers = {} unless headers
    query = {}
    query.merge!(options) if options
    
    begin
      response = HTTParty.get(url, query: query, :headers => headers)
      return response.body
    rescue Exception => e
      raise HttpError.new( e.message, e, {
        url: "#{url}/?#{URI.encode_www_form(query)}",
        status_code: response.code
      })
    end
  
  end

  private
  def self.required
    method = caller_locations(1,1)[0].label
    raise ArgumentError,
      "A required keyword argument was not specified when calling '#{method}'"
  end
end