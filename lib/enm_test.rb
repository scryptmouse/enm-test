# frozen_string_literal: true

require_relative "enm_test/version"

# Use Ruby-version-specific Rust library if present. When the gem is compiled
# via the cross-gem action, it is placed in a version specific directory. E.g.
# for the Linux gem as of this writing, there will be files at:
#   * enm_test/3.4/enm_test.so
#   * enm_test/4.0/enm_test.so
# We fall back to just enm_test/enm_test.so because
# rake compile puts it there during manual build/development.
begin
  warn "RUBY DEBUGGING #{RUBY_PLATFORM} #{RUBY_VERSION}"

  RUBY_VERSION =~ /(\d+\.\d+)/

  require "enm_test/#{Regexp.last_match(1)}/enm_test"
rescue LoadError
  require "enm_test/enm_test"
end

module ENMTest
  class Error < StandardError; end
  # Your code goes here...
end
