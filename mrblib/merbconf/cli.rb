module Merbconf
  class CLI
    def self.run(argv)
      new(argv).run
    end

    def initialize(argv)
      @option = Option.parse(argv)
    end

    def run
      resolver = Resolver.new(@option[:def_file_path])

      if @option.args[0].nil? || @option.args[1].nil? || @option.args[2].nil?
        STDERR.puts "invalid argument"
        exit 1
      end

      resolver.erb(@option.args[0], @option.args[1], @option.args[2])
    end
  end
end
