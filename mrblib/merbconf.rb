def __main__(argv)
  if argv[1] == "version"
    puts "v#{Merbconf::VERSION}"
  else
    Merbconf::CLI.run(argv)
  end
end
