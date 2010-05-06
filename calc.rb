require 'lib/time_entry'
require 'money'

entries = TimeEntry.load_csv "time-report.csv"
totalvalue = Money.us_dollar 0

entries.each do |e|
  totalvalue += e.value
  puts "#{e.hours} at #{e.rate.format}/hour #{e.rate_type} for #{e.company} is #{e.value.format}"
end

puts "Total monetary value for this report is: #{totalvalue.format}"