# -*- encoding: utf-8 -*-
require File.expand_path("../lib/current_object/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "current_object"
  s.version     = CurrentObject::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Dane Harrigan']
  s.email       = ['dane.harrigan@gmail.com']
  s.homepage    = "http://rubygems.org/gems/current_object"
  s.summary     = "Give any class a notion of what its current instance is."
  s.description = "Do you need to keep track of a current user, account, page, etc? The current_object gem does just that."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "current_object"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  s.add_development_dependency 'rspec', '>= 2.1'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
