# Load the Redmine helper
require File.expand_path(File.dirname(__FILE__) + '/../../../test/test_helper')

Dir[AddToCalendar.root.join('test/factories/*.rb')].each { |f| require f }

module AddToCalendar
  module TestHelper
    include FactoryGirl::Syntax::Methods
  end
end

Redmine::IntegrationTest.send :include, AddToCalendar::TestHelper
