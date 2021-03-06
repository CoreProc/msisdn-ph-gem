# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Msisdn/version'

Gem::Specification.new do |spec|
  spec.name          = "msisdn-ph"
  spec.version       = Msisdn::VERSION
  spec.authors       = ["Jameson Candava"]
  spec.email         = ["candavajameson@gmail.com"]

  spec.summary       = %q{MSISDN Philippine identification.}
  spec.description   = %q{An MSISDN identification and cleaner library for Philippine telco subscribers.}
  spec.homepage      = "http://github.com/coreproc/msisdn-ph-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.2.0"
end
