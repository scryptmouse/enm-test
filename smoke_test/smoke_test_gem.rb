# frozen_string_literal: true

raise "Must provide gem file glob" if ARGV.length != 1

gem_files = Dir.glob(ARGV.first)
raise "Unable to find single gem file, found #{gem_files.length}" unless gem_files.length == 1

system("gem", "install", "--verbose", gem_files.first, exception: true)

# Create a local environment and start a workflow
require "enm_test"

puts ENMTest.hello("world")
