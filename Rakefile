task :bundle_install do
  system("bundle")
end

require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => [:bundle_install, :spec]
