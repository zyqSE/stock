# -*- encoding: utf-8 -*-
# stub: turbolinks 5.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "turbolinks"
  s.version = "5.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2018-08-20"
  s.description = "Rails engine for Turbolinks 5 support"
  s.email = "david@loudthinking.com"
  s.homepage = "https://github.com/turbolinks/turbolinks"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "Turbolinks makes navigating your web application faster"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<turbolinks-source>, ["~> 5.2"])
    else
      s.add_dependency(%q<turbolinks-source>, ["~> 5.2"])
    end
  else
    s.add_dependency(%q<turbolinks-source>, ["~> 5.2"])
  end
end
