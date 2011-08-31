file = ARGV[0]
alphabet = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}

f = File.open(file)
f.each do |line|
  characters = line.downcase.split('').uniq.sort
  leftover = alphabet - characters
  if leftover.empty?
    puts "NULL"
  else
    puts leftover.join("")
  end
end
