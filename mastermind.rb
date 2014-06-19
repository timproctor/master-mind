Dir["./lib/*.rb"].each {|file| require "#{file}"}

Cli.run
