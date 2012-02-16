#!/bin/env ruby

require 'net/http'

total = ""

res = Net::HTTP.get('www.eventbrite.com', '/')
res.split("\n").each do |r|
  break if r.match(/Tickets sold/) # don't process entire HTTP return
  if r.match(/ticker_(\d)/) # see if line contains the ticker class
    total += $1 # concat to end of total string
  end
end

puts total
