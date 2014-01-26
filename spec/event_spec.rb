require 'spec_helper'

describe Instapush::Event do
  it 'should take a name as parameter' do
    event = Instapush::Event.new 'event'
    event.name.should eq('event')
  end

  it 'should accept a hash of trackers' do
    event = Instapush::Event.new 'event'
    data = { a: 5, b: 7 }
    event.tracker= data

    event.tracker.should equal(data)
  end
end
