require 'rubygems'
require 'fastercsv'
require 'money'
require 'lib/rates'

# Represents a TimeEntry from Basecamp
class TimeEntry
  attr_accessor :date, :person, :hours, :description, :todo, :project
  attr_reader :company, :rate_key, :rate_type, :rate
  include Rates
  
  def initialize
    if block_given?
      yield self
    else
      self
    end
  end
  
  # Given a csv export file from a Basecamp Time report, create an array of TimeEntry objects and return it
  def TimeEntry.load_csv(file,ignore_first_line=true)
      
    ret = []
    FasterCSV.foreach(file, :headers => ignore_first_line) do |row|
      ret << TimeEntry.new do |t|
        t.date = Date.parse(row[0])
        t.person = row[1]
        t.hours = row[2].to_f
        t.description = row[3]
        t.todo = row[4]
        t.company = row[5]
        t.project = row[6]
      end
    end
    return ret
  end
  
  # return a money object with the value of this entry
  def value
    return @rate * @hours
  end
  
  def company=(val)
     @company = val
     @rate_key = @company
     @rate_type = get_rate_type()
     unless rate_type.nil?
       @rate_key = "#{@company}_#{@rate_type}"
     end
     @rate = Rates::RATES[@rate_key] || Money.us_dollar(50)
  end
  
  private 
  
  def get_rate_type
    potentials =  /([A-Z0-9]{2,5})/.match(@description)
    unless potentials.nil?
      if not potentials[0].nil? and Rates::RATETYPES[potentials[0]]
        return potentials[0]
      end
    end
    return nil
  end
end