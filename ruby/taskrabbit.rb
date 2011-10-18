#!/bin/env ruby

require 'net/http'

res = Net::HTTP.get('www.taskrabbit.com', '/')
res.split("\n").each do |r|
  puts r
end

