module Merbconf
  class Resolver
    def initialize(bind)
      @bind = bind
    end

    def erb(src_path, dest_path, template_file_name)
      template_file_path = File.join(src_path, template_file_name)
      dest_file_path = File.join(dest_path, template_file_name.gsub(".erb", ""))

      template_file = File.open(template_file_path) { |f| f.read }
      File.open(dest_file_path, "w") do |f|
        f.write(ERB.new(template_file).result(@bind))
      end
    end
  end
end
