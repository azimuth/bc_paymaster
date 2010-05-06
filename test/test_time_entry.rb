require 'time_entry'
require 'test_helper'
require 'tempfile'
require 'rubygems'
require 'money'

class TestTimeEntry < Test::Unit::TestCase

  context "create an empty TimeEntry" do
    should "be a TimeEntry" do
      assert_kind_of TimeEntry, TimeEntry.new
    end
    
    should "be empty" do
      te = TimeEntry.new
      assert te.date.nil?
    end
    
  end
  
  context "new TimeEntry with block" do
    setup do
      @te = TimeEntry.new do |t|
        t.date        = Date.parse("2010-04-05")
        t.person      = "Christopher Maujean"
        t.hours       = 0.266667
        t.description = "setting up a bcproj instance for CR"
        t.todo        = "Implement BCProj for CR (config w/ 8hr ""contract"")"
        t.company     = "Azimuth Internet Services, Ltd"
        t.project     = "Azimuth Accounting & Finance"
      end
    end
    
    should "be a TimeEntry" do
      assert_kind_of TimeEntry, @te 
    end
    
    should "have attributes as entered in block form" do
      assert @te.date        == Date.parse("2010-04-05")
      assert @te.person      == "Christopher Maujean"
      assert @te.hours       == 0.266667
      assert @te.description == "setting up a bcproj instance for CR"
      assert @te.todo        == "Implement BCProj for CR (config w/ 8hr ""contract"")"
      assert @te.company     == "Azimuth Internet Services, Ltd"
      assert @te.project     == "Azimuth Accounting & Finance"
    end
  end
  
  context "TimeEntry.load_csv" do
    should "accept a file and return an array of TimeEntry objects" do
      entries = TimeEntry.load_csv('time-report.csv')
      assert_kind_of Array, entries
      assert_kind_of TimeEntry, entries[0]
    end
  end
  
  context "TimeEntry#value" do
    setup do
      tf = Tempfile.open("calc")
      tf.puts '2010-04-05,"Christopher Maujean",0.266667,"setting up a bcproj instance for CR","Implement BCProj for CR (config w/ 8hr ""contract"")","Azimuth Internet Services, Ltd","Azimuth Accounting & Finance"'
      tf.flush
      @entries = TimeEntry.load_csv(tf.path, false)
      tf.unlink
    end
    
    should "return a valid, correct Money object for the hours stored" do
      assert_kind_of Money, @entries[0].value
      assert @entries[0].value.to_f == Money.us_dollar(0.266667 * 20 * 100).to_f
    end
  end
  
end