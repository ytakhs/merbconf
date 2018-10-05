MRuby::Gem::Specification.new("merbconf") do |spec|
  spec.license = "MIT"
  spec.author  = "Yuji Takahashi"
  spec.summary = "merbconf"
  spec.bins    = ["merbconf"]

  spec.add_dependency "mruby-print", core: "mruby-print"

  spec.add_dependency "mruby-dir",      mgem: "mruby-dir"
  spec.add_dependency "mruby-dir-glob", mgem: "mruby-dir-glob"
  spec.add_dependency "mruby-env",      mgem: "mruby-env"
  spec.add_dependency "mruby-erb",      mgem: "mruby-erb"
  spec.add_dependency "mruby-yaml",     mgem: "mruby-yaml"

  spec.add_test_dependency "mruby-mtest", mgem: "mruby-mtest"
end
