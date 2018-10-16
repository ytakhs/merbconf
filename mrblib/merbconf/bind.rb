module Merbconf
  class Bind
    def initialize(def_file_path = nil)
      @variable_mapping = def_file_path ? YAML.load(File.read(def_file_path)).fetch("variables") : {}
    end

    private

    def fetch(name, default = nil)
      ENV.fetch(name, default)
    end

    def method_missing(name, *args)
      if (variable = @variable_mapping[name.to_s])
        fetch(variable["env"], variable["default"])
      else
        super
      end
    end
  end
end
