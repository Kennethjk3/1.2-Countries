countries_list = []

File.open('countries.txt', 'r+') do |places|
  places.each do |list|
    countries_list.push(list.gsub('|', ' - '))
  end
end

ignore = ["of", "and", "the"]
updated_list = countries_list.map do |cap|
 cap = cap.split(' - ')
 cap[1] = cap[1].split(' ')
 .each{|a| a.capitalize! unless ignore.include? a }
 .join(' ')
cap.push(updated_list)
.join(' - ')
end

puts "There are #{updated_list.count} countries accounted for here. They are as follows:"

for i in 0...updated_list.count
  puts updated_list[i]
end

new_file = File.new("updated_countries.txt", "w+")
   new_file.puts "There are #{[updated_list.count]} countries accounted for here. There are as follows:\n#{updated_list.join("\n")}"
new_file.close
