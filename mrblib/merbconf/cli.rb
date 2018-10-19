module Merbconf
  class CLI
    def self.run(argv)
      new(argv).run
    end

    def initialize(argv)
      @command = argv[0]
      @option = Option.parse(argv)
    end

    def run
      bind = Bind.new(@option[:def_file_path])
      converter = Converter.new(bind)

      src_dir = @option.args[0]
      dest_dir = @option.args[1]
      template_file_names = @option.args[2..-1]

      if src_dir.nil? || dest_dir.nil? || template_file_names.empty?
        $stdout.puts @option.help

        exit 0
      end

      [src_dir, dest_dir].each do |dir|
        if !File.exists?(dir)
          $stderr.puts "#{@command}: #{dir}: No such directory"

          exit 1
        end
      end

      if template_file_names.size == 1 && !@option[:each]
        template_file_name = template_file_names[0]
        template_file_path = File.join(src_dir, template_file_name)
        if !File.exists?(template_file_path)
          $stderr.puts "#{@command}: #{template_file_path}: No such file"

          exit 1
        end
        converter.erb(src_dir, dest_dir, template_file_name, @option[:rename])
      else
        if !@option[:rename].nil?
          $stderr.puts "#{@command}: `rename` option is not available for multiple template file names."
          exit 1
        end

        converter.erb_each(src_dir, dest_dir, *template_file_names)
      end
    end
  end
end
