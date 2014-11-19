#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rubocop/rake_task'

DevFuBase::Application.load_tasks

RuboCop::RakeTask.new do |task|
  task.formatters = %w[ simple ]
end

task('spec').clear # remove default spec task
RSpec::Core::RakeTask.new :spec => :rubocop
