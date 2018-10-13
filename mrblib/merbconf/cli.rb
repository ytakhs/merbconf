module Merbconf
  module CLI
    def self.run(argv)
      option = Option.parse(argv)
      puts option.def_file_path
    end
  end
end
