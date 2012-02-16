#!/bin/env ruby

require 'hpricot'
require 'open-uri'

# grab HTML and parse with Hpricot
doc = open("http://www.taskrabbit.com"){|f| Hpricot(f)}

# get list of tasks
tasks = []
tasks_html = doc.search("div.clear/ul/li/div/p/a")
tasks_html.each {|t| tasks << t.inner_html}

# output list of tasks
puts "Tasks on taskrabbit.com landing page:"
tasks.each {|task| puts "- #{task}"}
