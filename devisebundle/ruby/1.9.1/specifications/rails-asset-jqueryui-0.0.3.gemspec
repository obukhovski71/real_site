# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails-asset-jqueryui}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["allen13"]
  s.date = %q{2011-12-02}
  s.description = %q{A gemified version of the jquery-ui javascript library.}
  s.email = ["kex.allen13@gmail.com"]
  s.homepage = %q{https://github.com/allen13/rails-asset-jqueryui}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rails-asset-jqueryui}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{A gemified version of the jquery-ui javascript library.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 3.1.0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.1.0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.1.0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
  end
end
