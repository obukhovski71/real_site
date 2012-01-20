# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-core}
  s.version = "2.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Baker", "David Chelimsky", "Chad Humphries"]
  s.bindir = %q{exe}
  s.date = %q{2012-01-05}
  s.description = %q{BDD for Ruby. RSpec runner and example groups.}
  s.email = %q{rspec-users@rubyforge.org}
  s.executables = ["autospec", "rspec"]
  s.extra_rdoc_files = ["README.md", "License.txt"]
  s.files = ["exe/autospec", "exe/rspec", "README.md", "License.txt"]
  s.homepage = %q{http://github.com/rspec/rspec-core}
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rspec}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{rspec-core-2.8.0}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
