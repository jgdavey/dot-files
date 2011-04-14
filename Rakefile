require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    if File.exist?(File.join(ENV['HOME'], ".#{name_for_file(file)}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{name_for_file(file)}")
        puts "identical ~/.#{name_for_file(file)}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{name_for_file(file)}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{name_for_file(file)}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system "rm -rf \"$HOME/.#{name_for_file(file)}\""
  link_file(file)
end

def name_for_file(file)
  file.sub('.erb', '')
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{name_for_file(file)}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -fs "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
