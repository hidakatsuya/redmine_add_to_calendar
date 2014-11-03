RedmineApp::Application.routes.draw do
  controller :add_to_calendar, path: 'add_to_calendar' do
    get 'issues', as: 'add_issues_to_calendar'
  end
end
