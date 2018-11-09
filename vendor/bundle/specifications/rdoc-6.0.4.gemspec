# -*- encoding: utf-8 -*-
# stub: rdoc 6.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rdoc"
  s.version = "6.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 2.2") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eric Hodel", "Dave Thomas", "Phil Hagelberg", "Tony Strauss", "Zachary Scott", "Hiroshi SHIBATA", "ITOYANAGI Sakura"]
  s.bindir = "exe"
  s.date = "2018-05-04"
  s.description = "RDoc produces HTML and command-line documentation for Ruby projects.\nRDoc includes the +rdoc+ and +ri+ tools for generating and displaying documentation from the command-line.\n"
  s.email = ["drbrain@segment7.net", "", "", "", "mail@zzak.io", "hsbt@ruby-lang.org", "aycabta@gmail.com"]
  s.executables = ["rdoc", "ri"]
  s.extra_rdoc_files = ["CVE-2013-0256.rdoc", "CONTRIBUTING.rdoc", "ExampleMarkdown.md", "ExampleRDoc.rdoc", "History.rdoc", "LEGAL.rdoc", "LICENSE.rdoc", "README.rdoc", "RI.rdoc", "TODO.rdoc"]
  s.files = ["CONTRIBUTING.rdoc", "CVE-2013-0256.rdoc", "ExampleMarkdown.md", "ExampleRDoc.rdoc", "History.rdoc", "LEGAL.rdoc", "LICENSE.rdoc", "README.rdoc", "RI.rdoc", "TODO.rdoc", "exe/rdoc", "exe/ri"]
  s.homepage = "https://ruby.github.io/rdoc"
  s.licenses = ["Ruby"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2")
  s.rubygems_version = "2.5.2.1"
  s.summary = "RDoc produces HTML and command-line documentation for Ruby projects"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<racc>, ["> 1.4.10"])
      s.add_development_dependency(%q<kpeg>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 5"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<racc>, ["> 1.4.10"])
      s.add_dependency(%q<kpeg>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 5"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<racc>, ["> 1.4.10"])
    s.add_dependency(%q<kpeg>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 5"])
  end
end
