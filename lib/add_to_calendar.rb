require 'pathname'

module AddToCalendar
  def self.root
    @root ||= Pathname.new(File.expand_path('../../', __FILE__))
  end
end

# Load hooks
Dir[AddToCalendar.root.join('app/hooks/*_hook.rb')].each {|f| require f }
