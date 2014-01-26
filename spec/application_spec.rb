require 'spec_helper'

describe Instapush::Application do
  before(:each) do
    @event = Instapush::Event.new 'event'
  end

  it 'should fail on invalid push argument' do
    app = Instapush::Application.new 'id', 'secret'
    lambda { app.push('foo')}.should raise_error(ArgumentError)
  end

  it 'should use HTTP by default' do
    app = Instapush::Application.new 'id', 'secret'
    stub_request(:post, "http://api.instapush.im/post")

    app.push @event
  end

  it 'should use HTTPS if requested' do
    app = Instapush::Application.new 'id', 'secret', use_ssl: true
    stub_request(:post, "https://api.instapush.im/post").with(body: {})

    app.push @event
  end

  it 'should send the event name in the body' do
    app = Instapush::Application.new 'id', 'secret'
    stub_request(:post, "api.instapush.im/post").with(:body => "{\"event\":\"event\",\"trackers\":{}}")

    app.push @event
  end

  it 'should send the app id as POST header' do
    app = Instapush::Application.new 'id', 'secret'
    stub_request(:post, "api.instapush.im/post").with(:body => "{\"event\":\"event\",\"trackers\":{}}", :headers => { 'X-INSTAPUSH-APPSECRET' => 'secret' })

    app.push @event
    
  end

  it 'should send the app secret as POST header' do
    app = Instapush::Application.new 'id', 'secret'
    stub_request(:post, "api.instapush.im/post").with(:body => "{\"event\":\"event\",\"trackers\":{}}", :headers => { 'X-INSTAPUSH-APPID' => 'id' })

    app.push @event
  end
end
