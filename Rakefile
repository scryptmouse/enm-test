# frozen_string_literal: true

require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  # Allow build-only environments to skip test dependencies.
end

begin
  require "rubocop/rake_task"
  RuboCop::RakeTask.new
rescue LoadError
  # Allow build-only environments to skip lint dependencies.
end

require "rb_sys/extensiontask"

task build: :compile

GEMSPEC = Gem::Specification.load("enm_test.gemspec")

RbSys::ExtensionTask.new("enm_test", GEMSPEC) do |ext|
  ext.lib_dir = "lib/enm_test"
end

default_tasks = [:compile]
default_tasks << :spec if Rake::Task.task_defined?("spec")
default_tasks << :rubocop if Rake::Task.task_defined?("rubocop")
task default: default_tasks
