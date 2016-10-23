require_relative 'concerns/http_error'
class HttpClient

  def self.get(url: nil, query: nil, headers: nil)
    raise 'Url não informada' unless url
    headers = {} unless headers
    query_string = {}
    query_string.merge!(query) if query

    begin
      response = HTTParty.get(url, query: query_string, :headers => headers)
      return response
    rescue Exception => e
      raise HttpError.new( e.message, e, {
        url: "#{url}/?#{URI.encode_www_form(query_string)}",
        status_code: response.code
      })
    end

  end

  def self.post(url: nil, query: nil, headers: nil, form: nil)
    raise 'Url não informada' unless url
    headers = {} unless headers
    query_string = {}
    query_string.merge!(query) if query
    form_data = {}
    form_data.merge!(form) if form

    begin
      response = HTTParty.post(url, query: query_string, :headers => headers, body: form_data)
      return response
    rescue Exception => e
      raise HttpError.new( e.message, e, {
        url: "#{url}/?#{URI.encode_www_form(query_string)}",
        form: form_data,
        status_code: response.code
      })
    end

  end

end