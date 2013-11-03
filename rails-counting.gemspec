require "rubygems/package_task"
require File.expand_path("../lib/rails-counting/version.rb", __FILE__)

Gem::Specification.new do |s|
  s.name           = "rails-counting"
  s.version        = RailsCounting::Version.to_s
  s.summary        = "Define custom behavior when counting in AREL."
  s.description    = "This gem can define custom behavior when calling count on an AREL relation.  This is especially useful when using relation.select('column AS something'), which currently will cause SQL errors."
  s.author         = "Mike Virata-Stone"
  s.email          = "mike@virata-stone.com"
  s.license        = "MIT"
  s.files          = FileList["lib/**/*"]
  s.require_path   = "lib"
  s.homepage       = "https://github.com/mikestone/rails-counting"
  s.add_dependency "activerecord", "~> 4.0"
  s.add_dependency "activesupport", "~> 4.0"
end
