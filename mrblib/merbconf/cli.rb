module Merbconf
  class CLI
    def self.run(argv)
      new(argv).run
    end

    def initialize(argv)
      @option = Option.parse(argv)
    end

    def run
      bind = Bind.new(@option[:def_file_path])
      resolver = Resolver.new(bind)

      src_dir = @option.args[0]
      dest_dir = @option.args[1]
      template_file_name = @option.args[2]

      if src_dir.nil? || dest_dir.nil? || template_file_name.nil?
        $stderr.puts "invalid argument"
        $stderr.puts @option.help

        exit 1
      end

      [src_dir, dest_dir].each do |dir|
        if !File.exists?(dir)
          $stderr.puts "No such directory: #{dir}"

          exit 1
        end
      end

      template_file_path = File.join(src_dir, template_file_name)
      if !File.exists?(template_file_path)
        $stderr.puts "No such file: #{template_file_path}"

        exit 1
      end

      resolver.erb(src_dir, dest_dir, template_file_name)
    end
  end
end
