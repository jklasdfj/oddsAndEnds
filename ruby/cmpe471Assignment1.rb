input_file = File.open('input.txt', 'r')
contents = input_file.read

split_array = contents.split("\n") #need string interpolation to properly interpret newline
input_string = split_array.first
target_length = Integer(split_array.last)

puts "input string #{input_string} has length #{input_string.length}"
puts "targ length #{target_length}"

index = 0
array_length = (input_string.length/target_length).ceil

#forcibly fills with nils
# combinations = Array.new(array_length)
combinations = Array.new()


begin

  puts "index: #{index} with end #{index+target_length}"
  test = input_string[index...index+target_length]

  combinations.push(test)
  # puts "index #{index}: #{input_string[index...index+target_length]}"
  index+=1

end while index < input_string.length-target_length+1 # no +1

#puts combinations
puts combinations
combinations.sort!
puts "this many outputs #{combinations.length}"

index = 0

hash_count = Hash.new()

begin

  if  !hash_count.include?(combinations[index])
    hash_count[combinations[index]] = 1
  else
    hash_count[combinations[index]] += 1 #is this even legal?
  end
  index+=1
end while index < combinations.length


max_frequency =0
hash_count.each do |key, value|
  if hash_count[key] > max_frequency
    max_frequency = hash_count[key]
  end
end

most_frequent_kmers = []
hash_count.each do |key, value|
  if hash_count[key] == max_frequency
    most_frequent_kmers.push(key)
  end
end

puts "most frequent kmers: #{most_frequent_kmers}"
