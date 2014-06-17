#!/usr/bin/env rake
require 'rake'
require 'rspec'

path = File.expand_path('../spec', __FILE__)
task :default
Dir.foreach(path) do |item|
  file = File.expand_path(File.join(File.dirname(__FILE__), 'spec', item))
  next if /spec.rb/.match(item).nil?
  RSpec::Core::Runner.run([file])
  #Since most of the examples, contains a class User. We must get rid of that variable, after running each test file.
  Object.send(:remove_const, :User) if Object.constants.include?(:User)
end
