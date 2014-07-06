require 'rubygems'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs       = FileList['*-*/']
  t.test_files = FileList['*/tests.rb']
end

task default: :test
