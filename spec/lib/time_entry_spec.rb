require File.dirname(__FILE__) + '/../spec_helper'
require 'rubygems'
require 'money'
require 'time_entry'

describe TimeEntry do
  before do
    @te = TimeEntry.new do |t|
      t.date        = Time.new("2010-04-05")
      t.person      = "Christopher Maujean"
      t.hours       = 0.266667
      t.description = "setting up a bcproj instance for CR"
      t.todo        = "Implement BCProj for CR (config w/ 8hr ""contract"")"
      t.company     = "Azimuth Internet Services, Ltd"
      t.project     = "Azimuth Accounting & Finance"
    end
  end
  
  describe "new" do
    it "is a TimeEntry" do
      @te.kind_of?(TimeEntry).should be_true
    end
    it "is empty" do
      TimeEntry.new.date.should be_nil
    end
  end
  
  describe "new with block" do
    it "has attributes as passed in the block" do
      @te.date.should == Time.new("2010-04-05")
      @te.person.should == "Christopher Maujean"
      @te.hours.should == 0.266667
      @te.description.should == "setting up a bcproj instance for CR"
      @te.todo.should == "Implement BCProj for CR (config w/ 8hr ""contract"")"
      @te.company.should == "Azimuth Internet Services, Ltd"
      @te.project.should == "Azimuth Accounting & Finance"
    end
  end
  
  describe "load_csv" do
    it "accepts a file name and returns an array of TimeEntry objects" do
      entries = TimeEntry.load_csv(File.dirname(__FILE__) + '/../support/test-entries.csv')
      entries.kind_of?(Array).should be_true
      entries[0].kind_of?(TimeEntry).should be_true
    end
  end
  
  describe "value" do
    it "returns a valid, correct money object" do
      @te.value.should ==  Money.us_dollar(0.266667 * 20 * 100).to_f
    end
  end
end