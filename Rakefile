#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rake'

task :ci
folder_names = ["1-intention-revealing-method", "2-special-case-objects", "3-replace-method-with-method-object", "4-service-objects"]
folder_names.each do |folder_name|
  ruby "#{folder_name}/app.rb"
end
