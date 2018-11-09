# -*- encoding: utf-8 -*-
# stub: sdoc 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sdoc"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vladimir Kolesnikov", "Nathan Broadbent", "Jean Mertz", "Zachary Scott"]
  s.date = "2018-02-06"
  s.description = "rdoc generator html with javascript search index."
  s.email = "voloko@gmail.com mail@zzak.io"
  s.executables = ["sdoc", "sdoc-merge"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "bin/sdoc", "bin/sdoc-merge"]
  s.homepage = "https://github.com/zzak/sdoc"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.2.1"
  s.summary = "rdoc html with javascript search index."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdoc>, [">= 5.0"])
    else
      s.add_dependency(%q<rdoc>, [">= 5.0"])
    end
  else
    s.add_dependency(%q<rdoc>, [">= 5.0"])
  end
end
