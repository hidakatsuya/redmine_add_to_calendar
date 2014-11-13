Redmine::Plugin.register :redmine_add_to_calendar do
  name 'Redmine Add to Calendar'
  author 'Katsuya Hidaka'
  description 'Redmine plugin for adding issue to Calendar as event'
  version '0.0.1'
  requires_redmine '2.3'
  url 'https://github.com/hidakatsuya/redmine_add_to_calendar'
  author_url 'https://twitter.com/hidakatsuya'
end

require_relative 'lib/add_to_calendar'
