require 'spec_helper'
require 'lanyrd'

describe Lanyrd::Client do
  before(:each) { @lanyrd = Lanyrd::Client.new }

  it "should search lanyrd" do
    @lanyrd.search('ruby').should be_an_instance_of Hash
  end

  it "should return popular events" do
    @lanyrd.popular.should be_an_instance_of Hash
  end

  it "should return popular events" do
    @lanyrd.popular.should be_an_instance_of Hash
  end

  it "should return event information" do
    @lanyrd.event('cfdbd').should be_an_instance_of Hash
  end

  it "should return speakers for an event" do
    @lanyrd.speakers('cfdbd').should be_an_instance_of Hash
  end

  it "should return attendees for an event" do
    @lanyrd.attendees('cfdbd').should be_an_instance_of Hash
  end
end