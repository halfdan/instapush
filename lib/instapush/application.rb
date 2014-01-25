require 'uri'
require 'net/http'
require 'json'

module Instapush
  class Application
    def initialize(app_id, app_secret)
      @app_id = app_id
      @app_secret = app_secret
      @api_url = 'http://api.instapush.im/post'
    end

    def push(event)
      raise(ArgumentError, "event must be an Instapush::Event") unless event.instance_of? Event

      data = { :event => event.name, :trackers => event.tracker }

      uri = URI.parse(@api_url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body= data.to_json
      request.content_type = 'application/json'
      request['X-INSTAPUSH-APPID'] = @app_id
      request['X-INSTAPUSH-APPSECRET'] = @app_secret

      http.request(request)
    end
  end
end
