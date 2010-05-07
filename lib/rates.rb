require 'money'

# Constants for Azimuth Rates and Rate Types
module Rates
  
  RATETYPES = {
    'AA'   => { :name => "Administrative Assistance", :default_rate => Money.us_dollar(8000) },
    'AD'   => { :name => "Application Development", :default_rate => Money.us_dollar(14000) },
    'BC'   => { :name => "Business Consulting", :default_rate => Money.us_dollar(12000) },
    'CC'   => { :name => "Communications", :default_rate => Money.us_dollar(6000) },
    'CS'   => { :name => "Customer Service", :default_rate => Money.us_dollar(6000) },
    'DA'   => { :name => "Database Administration", :default_rate => Money.us_dollar(14000) },
    'GD'   => { :name => "Graphic Design", :default_rate => Money.us_dollar(12000) },
    'HT'   => { :name => "HTML Updates", :default_rate => Money.us_dollar(8000) },
    'IM'   => { :name => "Image Manipulation", :default_rate => Money.us_dollar(12000) },
    'MS'   => { :name => "Misc Support", :default_rate => Money.us_dollar(8000) },
    'PM'   => { :name => "Project Management", :default_rate => Money.us_dollar(12000) },
    'SY'   => { :name => "Systems Administration", :default_rate => Money.us_dollar(16000) },
    'SA'   => { :name => "Systems Analysis", :default_rate => Money.us_dollar(16000) },
    'SP'   => { :name => "Systems Planning/Architecture", :default_rate => Money.us_dollar(16000) },
    'TC'   => { :name => "Technical Consulting", :default_rate => Money.us_dollar(14000) },
    'TS'   => { :name => "Technical Support", :default_rate => Money.us_dollar(8000) },
    'DT'   => { :name => "Travel", :default_rate => Money.us_dollar(6000) },
    'NC'   => { :name => "No Charge to customer", :default_rate => Money.us_dollar(2000)},
    'PDI'  => { :name => "Product Data Integration Flat Rate Project", :default_rate => Money.us_dollar(0) },
    'P1FR' => { :name => "INITIAL FLAT RATES for RTW", :default_rate => Money.us_dollar(0)}
  }
  
  RATES = {
    "Azimuth Internet Services, Ltd" => Money.us_dollar(2000),
    "Great Coffees of America" => Money.us_dollar(3200),
    "The Coffee Review, Inc." => Money.us_dollar(5350),
    "The Coffee Review, Inc._TC" => Money.us_dollar(5350),
    "Curaderm Global_PM" => RATETYPES['PM'][:default_rate] / 2,
    "Road Town Wholesale" => Money.us_dollar(7000),
    "Road Town Wholesale_TC" => RATETYPES['TC'][:default_rate] / 2,
    "Road Town Wholesale_PM" => RATETYPES['PM'][:default_rate] / 2,
    "Road Town Wholesale_PDI" => Money.us_dollar(0),
    "Road Town Wholesale_P1FR" => Money.us_dollar(0),
    "Road Town Wholesale_CC" => RATETYPES['CC'][:default_rate] / 2
  }
end