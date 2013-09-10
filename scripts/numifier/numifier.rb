#!/usr/bin/ruby

abort "Create an input file, 'in.txt' and try again." unless File.exists? 'in.txt'

File.open('in.txt', 'r') do |inf|
  while line = inf.gets
    if line =~ /\d+\)/
      num = line.match(/^\d+/)
      File.open('out.txt', 'a') do |of|
        of.puts line.gsub(/\d+\)/, "#{num}.")
      end
    end
  end
end

