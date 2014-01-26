require 'spec_helper'

describe Instapush::Event do
  it 'should take a name as parameter' do
    event = Instapush::Event.new 'event'
    event.name.should eq('event')
  end
end
