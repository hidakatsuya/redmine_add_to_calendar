class AddToCalendarHook < Redmine::Hook::ViewListener
  render_on :view_issues_context_menu_end, partial: 'add_to_calendar_hook/issues_context_menu'
end
