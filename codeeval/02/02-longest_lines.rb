ltp = nil
lines = []

File.open(ARGV[0]).each do |line|
  if ltp.nil?
    ltp = line.chomp.to_i
  else
    lines << line.chomp unless line.strip == ""
  end
end

lines.sort!{|a,b| b.length <=> a.length}
0.upto(ltp - 1) {|i| puts lines[i]}
