require 'spec_helper'
require 'lanyrd'

describe Lanyrd::Client do
  before(:each) { @lanyrd = Lanyrd::Client.new }

  it "should search lanyrd" do
    @lanyrd.search('ruby').should be_an_instance_of Array
  end

  it "should return popular events" do
    @lanyrd.popular.should be_an_instance_of Array
  end

  it "should return event information" do
    @lanyrd.event('fosdem').should be_an_instance_of Hash
  end

  it "should return event information from the past" do
    @lanyrd.event('bathcamp-32', 2012).should be_an_instance_of Hash
  end

  it "should return speakers for an event" do
    @lanyrd.speakers('fosdem').should be_an_instance_of Array
  end

  it "should return attendees for an event" do
    @lanyrd.attendees('fosdem').should be_an_instance_of Array
  end

  it "should return the schedule for an event" do
    @lanyrd.schedule('fosdem').should be_an_instance_of Array
  end

  it "should return profile for a user" do
    @lanyrd.profile('teabass').should be_an_instance_of Hash
  end
  
  it "should return a users future events" do
    @lanyrd.future_events('kushalp').should be_an_instance_of Array
  end
end