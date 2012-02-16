#!/bin/env ruby

require 'json'
require 'net/http'

# helper method to determine final URL from redirects
def get_final_url(url_string)
  url = URI.parse(url_string)
  found = false
  until found
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port){|h| h.request(req)}
    res_header_location = res.header['location']
    res_header_location ? url = URI.parse(res_header_location) : found = true
    break unless url.to_s.match('^http')
  end
  url.to_s
end

# helper method for determining if a shortened URL redirects to an Eventbrite blog post
# returns false if not, the blog link if it does
def contains_eb_blog_post(tweet)
  url = tweet.match(/http:\/\/t\.co\/\w* /).to_s.chomp
  return false if url.empty?
  final_url = get_final_url(url)
  return (final_url.match(/http:\/\/blog.eventbrite.com/) ? final_url : false)
end

###################
# main program here
###################

url = URI.parse("http://twitter.com/status/user_timeline/eventbrite.json")
res = Net::HTTP.get(url)
posts = JSON.parse(res)

num_replies = 0
num_retweets = 0
blog_posts = []

posts.each do |post|
  plain_text = post["text"]

  num_replies  += 1 if plain_text.match(/^@.+ /) # assuming replies start with "@<twitter name> "
  num_retweets += 1 if plain_text.match(/^RT /) # assuming retweets start with "RT "

  blog_post_url = contains_eb_blog_post(plain_text)
  blog_posts << blog_post_url if blog_post_url
end

# assuming that a post is any twitter update that isn't a reply or a retweet
num_posts = posts.length - num_replies - num_retweets

puts "Stats:"
puts " Retweets: #{num_retweets}"
puts " Posts: #{num_posts}"
puts " Replies: #{num_replies}"
puts "Posts:"

if blog_posts.empty?
  puts " None"
else
  blog_posts.each{|bp| puts " #{bp}"}
end
