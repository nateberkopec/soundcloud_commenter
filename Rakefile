require 'dotenv/tasks'

task :environment => :dotenv do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
end

task :dictbuild_hot => :environment do
  sc = Soundcloud.new(:client_id => ENV['SC_CLIENT_ID'])
  tracks = sc.get('/tracks', :limit => 100, :order => 'hotness')
  rejection_regex = %r(http:|https:)
  File.open('dictionaries/hot.txt', 'a+') do |f|

    tracks.each do |track|
      comments = sc.get("/tracks/#{track.id}/comments")
      comments.each do |comment|
        next if comment.body.match(rejection_regex)
        puts comment.body
        f.puts comment.body #append to dict
      end
    end
  end
end

#trapishhiphopfuturebass
task :dictbuild_trap => :environment do
  sc = Soundcloud.new(:client_id => ENV['SC_CLIENT_ID'])
  tracks = sc.get('/tracks', :limit => 100, :order => 'hotness', :tag_list => 'trapishhiphopfuturebass')
  rejection_regex = %r(http:|https:)
  File.open('dictionaries/trap.txt', 'a+') do |f|

    tracks.each do |track|
      comments = sc.get("/tracks/#{track.id}/comments")
      comments.each do |comment|
        next if comment.body.match(rejection_regex)
        puts comment.body
        f.puts comment.body #append to dict
      end
    end
  end
end

#seapunk
task :dictbuild_seapunk => :environment do
  sc = Soundcloud.new(:client_id => ENV['SC_CLIENT_ID'])
  tracks = sc.get('/tracks', :limit => 100, :order => 'hotness', :tag_list => 'seapunk')
  rejection_regex = %r(http:|https:)
  File.open('dictionaries/seapunk.txt', 'a+') do |f|

    tracks.each do |track|
      comments = sc.get("/tracks/#{track.id}/comments")
      comments.each do |comment|
        next if comment.body.match(rejection_regex)
        puts comment.body
        f.puts comment.body #append to dict
      end
    end
  end
end

task :tweet => :environment do
  dictionaries = %w(trap hot seapunk)
  commenter = SoundcloudCommenter.new("dictionaries/#{dictionaries.sample}.txt")
  if Time.now.hour % 3 == 0 
    Twitter.update(sc.generate_comment)
  end
end

desc "Open an irb session preloaded with emmetty goodness"
task :console do
  sh "irb -rubygems -I . -r initializer.rb"
end
