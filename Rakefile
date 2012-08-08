require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install => [:install_dotfiles, :install_binlinks]

task :install_dotfiles do
  replace_all = false
  dotfiles = Dir['*'] - %w[Rakefile README.rdoc LICENSE bin]
  dotfiles.each do |file|
    LinkedDotFile.new(file).link!
  end
end

task :install_binlinks do
  system %Q[mkdir -p $HOME/bin]
  Dir['bin/*'].each do |bin|
    LinkedBinFile.new(bin).link!
  end
end

class LinkedFile
  attr_reader :file

  def initialize(filename)
    @file = filename
  end

  def basename
    file.split(/\//).last
  end

  def link!
    if File.exist?(linked_location)
      if File.identical? file, linked_location
        puts "identical #{pretty_linked_location}"
      else
        print "overwrite #{pretty_linked_location}? [ynq] "
        case $stdin.gets.chomp
        when 'y'
          replace_file
        when 'q'
          exit
        else
          puts "skipping #{pretty_linked_location}"
        end
      end
    else
      link_file
    end
  end

  def replace_file
    system %Q[rm -rf "#{linked_location}"]
    link_file
  end

  def link_file
    puts "linking #{pretty_linked_location}"
    system %Q{ln -fs "$PWD/#{file}" "#{linked_location}"}
  end
end

class LinkedBinFile < LinkedFile

  def linked_location
    File.join(destination, basename)
  end

  alias pretty_linked_location linked_location

  def destination
    File.join(ENV["HOME"], 'bin')
  end
end

class LinkedDotFile < LinkedFile
  def linked_location
    File.join(destination, ".#{file}")
  end

  def pretty_linked_location
    "~/.#{file}"
  end

  def destination
    ENV["HOME"]
  end
end
