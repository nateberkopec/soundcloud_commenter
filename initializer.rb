require "rubygems"
require "bundler/setup"

require 'dotenv'
Dotenv.load

require 'marky_markov'
require 'twitter'
require 'gabbler'
require 'soundcloud'
require 'yaml'
require 'securerandom'
require 'literate_randomizer'
require 'distribution'
require './soundcloud_commenter'

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end
