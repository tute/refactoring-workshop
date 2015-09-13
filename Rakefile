require 'rubygems'
require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs       = FileList['*-*/']
  t.test_files = FileList['*/tests.rb']
end

task default: :test
