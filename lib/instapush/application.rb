require 'uri'
require 'net/http'
require 'json'

module Instapush
  class Application
    def initialize(app_id, app_secret, opts = {})
      default_options = {
        :use_ssl => false
      }
      @options = default_options.merge(opts)

      @app_id = app_id
      @app_secret = app_secret

      scheme = @options[:use_ssl] ? 'https' : 'http'
      @api_url = "#{scheme}://api.instapush.im/post"
    end

    def push(event)
      raise(ArgumentError, "event must be an Instapush::Event") unless event.instance_of? Event

      data = { :event => event.name, :trackers => event.tracker }

      uri = URI.parse(@api_url)
      http = Net::HTTP.new(uri.host, uri.port)

      http.use_ssl = @options[:use_ssl];
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.request_uri)
      request.body= data.to_json
      request.content_type = 'application/json'
      request['X-INSTAPUSH-APPID'] = @app_id
      request['X-INSTAPUSH-APPSECRET'] = @app_secret

      http.request(request)
    end
  end
end
