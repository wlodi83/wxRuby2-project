require 'dbi'
DBI.available_drivers.each do |driver| 
    puts "Driver: " + driver 
    DBI.data_sources(driver).each do |dsn|  
        puts "  Datasource: " + dsn 
    end
end
