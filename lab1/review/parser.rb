require 'csv'
require 'erb'

# read
html = File.read("template.erb")

# replace
records = []
CSV.foreach("data.csv", headers: true) do |row|
  records << row.to_hash
end

records = records.sort {|x,y| x["Age"].to_i <=> y["Age"].to_i}

# total_age = 0
# records.each do |record|
#   total_age += record["Age"].to_i
# end

ages = records.map {|record| record["Age"].to_i }

# get the average age
average_age = ages.reduce(:+) / records.count


puts records.inspect

new_html = ERB.new(html).result(binding)

# write
File.open("report.html", "wb") do |file|
  file.write new_html
  file.close
end
