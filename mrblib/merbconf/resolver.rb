module Merbconf
  class Resolver
    def initialize(option)
      @bind = Bind.new(option.def_file)
    end

    def erb(src_path, dest_path, template_file_name)
      template_file_path = File.join(src_path, template_file_name)
      dest_file_path = File.join(dest_path, template_file_name.gsub(".erb", ""))

      File.write(ERB.new(File.read(template_file_path)).resolve(@bind))
    end
  end
end
