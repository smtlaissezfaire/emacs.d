#!/usr/bin/env ruby

require "rubygems"
require "rake"

namespace :git do
  desc "Update submodules"
  task :init do
    sh "git submodule update --init"
    sh "cd vendor/rinari && git submodule update --init"
  end
end
