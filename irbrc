require 'pp'
require 'rubygems'

begin
  require 'wirble'

  Wirble.init(:history_size => 10000)

  # This scheme assumes a dark background
  Wirble::Colorize.colors = {
      # delimiter colors
      :comma              => :white,
      :refers             => :white,

      # container colors (hash and array)
      :open_hash          => :white,
      :close_hash         => :white,
      :open_array         => :white,
      :close_array        => :white,

      # object colors
      :open_object        => :light_red,
      :object_class       => :red,
      :object_addr_prefix => :light_gray,
      :object_line_prefix => :light_gray,
      :close_object       => :light_red,

      # symbol colors
      :symbol             => :light_blue,
      :symbol_prefix      => :light_blue,

      # string colors
      :open_string        => :light_green,
      :string             => :light_green,
      :close_string       => :light_green,

      # misc colors
      :number             => :cyan,
      :keyword            => :orange,
      :class              => :red,
      :range              => :light_blue,
    }

  # == Possible Colors
  # :nothing        :green            :light_purple
  # :black          :light_blue       :purple
  # :blue           :light_cyan       :red
  # :brown          :light_gray       :white
  # :cyan           :light_green      :yellow
  # :dark_gray      :light_red

  Wirble.colorize

rescue LoadError
  puts "please run: `sudo gem install wirble`"
end

begin
  require 'hirb'
  Hirb.enable
rescue LoadError
  puts "please run: `sudo gem install cldwalker-hirb --source http://gems.github.com`"
end

class Object
  # Return a list of methods defined locally for a particular object.  Useful
  # for seeing what it does whilst losing all the guff that's implemented
  # by its parents (eg Object).
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

