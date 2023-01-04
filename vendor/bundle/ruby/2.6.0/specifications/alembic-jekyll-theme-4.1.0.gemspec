# -*- encoding: utf-8 -*-
# stub: alembic-jekyll-theme 4.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "alembic-jekyll-theme".freeze
  s.version = "4.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "plugin_type" => "theme" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Darnes".freeze]
  s.date = "2021-01-06"
  s.description = "A Jekyll boilerplate theme designed to be a starting point for any Jekyll website. Rather than starting from scratch, this boilerplate is designed to get the ball rolling immediately.".freeze
  s.email = ["me@daviddarnes.com".freeze]
  s.homepage = "https://alembic.darn.es".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "A Jekyll boilerplate theme designed to be a starting point for any Jekyll website.".freeze

  s.installed_by_version = "3.0.3.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>.freeze, ["~> 4.1"])
      s.add_runtime_dependency(%q<jekyll-sitemap>.freeze, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<jekyll-mentions>.freeze, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<jekyll-paginate>.freeze, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<jekyll-seo-tag>.freeze, ["~> 2.6.1"])
      s.add_runtime_dependency(%q<jekyll-redirect-from>.freeze, ["~> 0.16"])
      s.add_runtime_dependency(%q<jekyll-feed>.freeze, ["~> 0.15"])
      s.add_runtime_dependency(%q<jekyll-commonmark>.freeze, ["~> 1.3.1"])
      s.add_runtime_dependency(%q<jekyll-include-cache>.freeze, ["~> 0.2"])
      s.add_runtime_dependency(%q<jemoji>.freeze, ["~> 0.12"])
    else
      s.add_dependency(%q<jekyll>.freeze, ["~> 4.1"])
      s.add_dependency(%q<jekyll-sitemap>.freeze, ["~> 1.4.0"])
      s.add_dependency(%q<jekyll-mentions>.freeze, ["~> 1.6.0"])
      s.add_dependency(%q<jekyll-paginate>.freeze, ["~> 1.1.0"])
      s.add_dependency(%q<jekyll-seo-tag>.freeze, ["~> 2.6.1"])
      s.add_dependency(%q<jekyll-redirect-from>.freeze, ["~> 0.16"])
      s.add_dependency(%q<jekyll-feed>.freeze, ["~> 0.15"])
      s.add_dependency(%q<jekyll-commonmark>.freeze, ["~> 1.3.1"])
      s.add_dependency(%q<jekyll-include-cache>.freeze, ["~> 0.2"])
      s.add_dependency(%q<jemoji>.freeze, ["~> 0.12"])
    end
  else
    s.add_dependency(%q<jekyll>.freeze, ["~> 4.1"])
    s.add_dependency(%q<jekyll-sitemap>.freeze, ["~> 1.4.0"])
    s.add_dependency(%q<jekyll-mentions>.freeze, ["~> 1.6.0"])
    s.add_dependency(%q<jekyll-paginate>.freeze, ["~> 1.1.0"])
    s.add_dependency(%q<jekyll-seo-tag>.freeze, ["~> 2.6.1"])
    s.add_dependency(%q<jekyll-redirect-from>.freeze, ["~> 0.16"])
    s.add_dependency(%q<jekyll-feed>.freeze, ["~> 0.15"])
    s.add_dependency(%q<jekyll-commonmark>.freeze, ["~> 1.3.1"])
    s.add_dependency(%q<jekyll-include-cache>.freeze, ["~> 0.2"])
    s.add_dependency(%q<jemoji>.freeze, ["~> 0.12"])
  end
end
