# frozen_string_literal: true

# Run with:
#   ruby cases/minimal_stable-0.7.rb
#   -or via docker-
#   docker run -it --rm -v "$(pwd)"/cases:/src -w /src ruby:3.2.2 ruby /src/minimal_stable-0.7.rb

require "bundler/inline"

gemfile do
  source "https://rubygems.org"

  gem "mini_racer", github: "rubyjs/mini_racer", branch: "stable-0.7"
end

require "libv8-node"
require "rbconfig"

puts "RbConfig::CONFIG['LIBS']: #{RbConfig::CONFIG["LIBS"]}"
puts "RUBY_VERSION : #{RUBY_VERSION}"
puts "RUBY_PLATFORM: #{RUBY_PLATFORM}"
puts "MiniRacer::VERSION: #{MiniRacer::VERSION}"
puts "MiniRacer::LIBV8_NODE_VERSION: #{MiniRacer::LIBV8_NODE_VERSION}"
puts "Libv8::Node::VERSION: #{Libv8::Node::VERSION}"
puts "Libv8::Node::NODE_VERSION: #{Libv8::Node::NODE_VERSION}"
puts "Libv8::Node::LIBV8_VERSION: #{Libv8::Node::LIBV8_VERSION}"

ctx = MiniRacer::Context.new

puts ctx.eval("1+1")
