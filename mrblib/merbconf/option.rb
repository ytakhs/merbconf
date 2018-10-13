module Merbconf
  class Option
    def self.parse(argv)
      option = new

      opt_parser = ::OptionParser.new do |opts|
        opts.banner = "Usage: merbconf [options] <src dir> <dest dir>"

        opts.on("-dDEF_FILE_PATH", "--def=DEF_FILE_PATH", "def file") do |d|
          option.def_file_path = d
        end

        opts.on("-h", "--help", "help") do
          STDOUT.puts opts
          exit 0
        end
      end
      opt_parser.parse!(argv)

      option
    end

    def initialize
      @def_file_path = nil
    end

    def def_file_path
      @def_file_path
    end

    def def_file_path=(def_file_path)
      @def_file_path = def_file_path
    end
  end
end
