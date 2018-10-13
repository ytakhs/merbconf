MRuby::Gem::Specification.new("merbconf") do |spec|
  spec.license = "MIT"
  spec.author  = "Yuji Takahashi"
  spec.summary = "merbconf"
  spec.bins    = ["merbconf"]

  spec.add_dependency "mruby-eval",  core: "mruby-eval"
  spec.add_dependency "mruby-print", core: "mruby-print"

  spec.add_dependency "mruby-dir",      mgem: "mruby-dir"
  spec.add_dependency "mruby-dir-glob", mgem: "mruby-dir-glob"
  spec.add_dependency "mruby-env",      mgem: "mruby-env"
  spec.add_dependency "mruby-erb",      mgem: "mruby-erb"
  spec.add_dependency "mruby-optparse", mgem: "mruby-optparse"

  spec.add_dependency "mruby-erb",  github: "jit-y/mruby-erb"
  spec.add_dependency "mruby-yaml", github: "jit-y/mruby-yaml"
end
