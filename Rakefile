#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rake'
require 'rspec/core/rake_task'
require 'rspec'

path = File.expand_path('../spec', __FILE__)
task :default
Dir.foreach(path) do |item|
  file = File.expand_path(File.join(File.dirname(__FILE__), 'spec', item))
  next if /spec.rb/.match(item).nil?
  RSpec::Core::Runner.run([file])
  Object.send(:remove_const, :User) if Object.constants.include?(:User)
end