module Merbconf
  class Option
    DEFAULT_OPTIONS = {
      def_file_path: nil,
      each: false,
    }

    def self.parse(argv)
      option = new

      opt_parser = ::OptionParser.new do |opts|
        opts.banner = "Usage: merbconf [options] <src dir> <dest dir>"

        opts.on("-d DEF_FILE_PATH", "--def=DEF_FILE_PATH", "def file") do |d|
          option[:def_file_path] = d
        end

        opts.on("-e", "--each", "each resolve") do |e|
          option[:each] = true
        end

        opts.on("-h", "--help", "help") do
          STDOUT.puts opts
          exit 0
        end
      end
      option.args = opt_parser.parse!(argv)[1..-1]

      option
    end

    def initialize
      @options = DEFAULT_OPTIONS.dup
      @args = []
    end

    def [](key)
      @options[key]
    end

    def []=(key, val)
      @options[key] = val
    end

    def args
      @args
    end

    def args=(args)
      @args = args
    end
  end
end
