require 'spec_helper'

describe Instapush::Application do
  it 'should fail on invalid push argument' do
    app = Instapush::Application.new 'key', 'secret'
    lambda { app.push('foo')}.should raise_error(ArgumentError)
  end
end
