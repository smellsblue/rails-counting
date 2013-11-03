require File.expand_path("../lib/rails-counting/version.rb", __FILE__)

GEM = "rails-counting-#{RailsCounting::Version}.gem"

def system_exec(cmd)
  puts "Executing: #{cmd}"
  results = %x[#{cmd}]
  puts results unless results.strip.empty?
end

task :build do
  puts "Building rails-counting"
  system_exec "gem build rails-counting.gemspec"
end

task :install => :build do
  puts "Installing rails-counting"
  system_exec "gem install --no-ri --no-rdoc #{GEM}"
end

task :tag do
  puts "Tagging rails-counting"
  system_exec "git tag -a #{RailsCounting::Version} -m 'Version #{RailsCounting::Version}' && git push --tags"
end

task :push => :build do
  puts "Pushing rails-counting"
  system_exec "gem push #{GEM}"
end
