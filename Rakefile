require 'dotenv/tasks'

task :environment => :dotenv do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require 'soundcloud_commenter'
end

task :dictbuild => :environment do
  #build dict
end

task :tweet => :environment do
  emmett = Emmett.new
  #if Time.now.hour % 3 == 0 
    Twitter.update(emmett.generate_tweet)
  #end
end

desc "Open an irb session preloaded with emmetty goodness"
task :console do
  sh "irb -rubygems -I . -r initializer.rb"
end
