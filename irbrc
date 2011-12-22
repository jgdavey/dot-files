# ~/.irbrc
# vim:set ft=ruby sw=2 sts=2:

require 'pp'

begin
  require 'hirb'
  Hirb.enable
rescue LoadError
end

class Object
  def show_log
    if defined?(Rails) && Rails.respond_to?(:logger=) && defined?(ActiveRecord)
      @original_logger = ActiveRecord::Base.logger
      Rails.logger = ActiveRecord::Base.logger = Logger.new($stderr)
    end
  end

  def hide_log
    if defined?(Rails) && Rails.respond_to?(:logger=) && defined?(ActiveRecord)
      Rails.logger = ActiveRecord::Base.logger = @original_logger
    end
  end
end
