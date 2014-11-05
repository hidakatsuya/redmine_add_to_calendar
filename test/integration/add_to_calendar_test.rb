require File.expand_path('../../test_helper', __FILE__)

class AddToCalendarTest < ActionController::IntegrationTest
  fixtures :projects,
           :users,
           :roles,
           :members,
           :issues,
           :issue_statuses,
           :projects_trackers,
           :enabled_modules

  setup do
    log_user 'jsmith', 'jsmith'
  end

  test 'an issue that both start_date and due_date is set' do
    issue = Issue.find(6)

    get add_issues_to_calendar_path(ids: [issue.id])

    assert_response :success
    assert_equal response.content_type, 'text/calendar'

    events = response_calendar_events

    assert_equal events.count, 1
    assert_issue_event events.first, issue
  end

  test 'an issue that due_date is not set' do
    issue = Issue.find(2)

    get add_issues_to_calendar_path(ids: [issue.id])

    assert_response :success
    assert_equal response.content_type, 'text/calendar'

    event = response_calendar_events.first
    assert_issue_event event, issue
  end

  test 'an issue that both start_date and due_date is not set' do
    issue = Issue.find(8)

    get add_issues_to_calendar_path(ids: [issue.id])

    assert_response :success
    assert_equal response.body, ' '
  end

  test 'multiple issues' do
    issue6 = Issue.find(6)
    issue7 = Issue.find(7)
    # both start_date and due_date is not set 
    issue8 = Issue.find(8)

    get add_issues_to_calendar_path(ids: [6, 7, 8])

    assert_response :success
    assert_equal response.content_type, 'text/calendar'

    events = response_calendar_events

    assert_equal events.count, 2

    issue6_event = events.detect {|e| e.url.to_s == issue_url(issue6) }
    assert_issue_event issue6_event, issue6

    issue7_event = events.detect {|e| e.url.to_s == issue_url(issue7) }
    assert_issue_event issue7_event, issue7
  end

  def response_calendar_events
    cal = Icalendar.parse(StringIO.new(response.body)).first
    assert_equal cal.ip_method, 'PUBLISH'
    cal.events
  end

  def assert_issue_event(event, issue)
    assert_equal event.summary, issue.subject
    assert_equal event.dtstart, issue.start_date
    assert_equal event.dtend, issue.due_date
    assert_equal event.url.to_s, issue_url(issue)
  end
end