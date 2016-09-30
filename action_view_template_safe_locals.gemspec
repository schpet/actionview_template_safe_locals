# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_view_template_safe_locals/version'

Gem::Specification.new do |spec|
  spec.name          = "action_view_template_safe_locals"
  spec.version       = ActionViewTemplateSafeLocals::VERSION
  spec.authors       = ["Peter Schilling"]
  spec.email         = ["peter@peterschilling.org"]

  spec.summary       = %q{Allow passing reserved words like "class", "next" etc to partials}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview", ">= 4.1"
  spec.add_development_dependency "rails", "~> 5.0"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
