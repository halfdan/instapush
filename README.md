# Instapush

This library provides an API wrapper for [Instapush.im](http://instapush.im). Instapush.im allows you to send push notification to your Android/iOS mobile from your application.

## Installation

Add this line to your application's Gemfile:

    gem 'instapush-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instapush-api

## Usage

Using the library requires only a few lines of code:

```
require 'instapush'

app = Instapush::Application.new 'id', 'secret'

event = Instapush::Event.new 'event-name'
event.tracker= { :version => '0.9.0' }

app.push event
```

## Contributing

1. Fork it ( http://github.com/halfdan/instapush/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
