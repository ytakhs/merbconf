module Merbconf
  class Bind
    def initialize(def_file_path = nil)
      @method_mapping = def_file_path ? YAML.load(File.read(def_file_path)).fetch("methods") : {}
    end

    private

    def fetch(name, default = nil)
      ENV.fetch(name, default)
    end

    def method_missing(name, *args)
      if (definition = @method_mapping[name.to_s])
        fetch(definition["env"], definition["default"])
      else
        super
      end
    end
  end
end
