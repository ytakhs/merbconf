module Merbconf
  class Bind
    def initialize(def_file_path)
      @method_mapping = YAML.load(File.read(def_file_path)).fetch("methods")
    end

    private

    def fetch(name, default = nil, &block)
      ENV.fetch(name, default, &block)
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
