class AddToCalendarController < ApplicationController
  unloadable

  def issues
    issues = Issue.where(id: params[:ids])
                  .where('start_date is not null or due_date is not null')

    return render nothing: true if issues.empty?

    calendar = Icalendar::Calendar.new
    calendar.publish

    issues.each do |issue|
      event = issue_event(issue)
      calendar.add_event(event)
    end

    send_data calendar.to_ical, type: :ics, filename: 'issue_events.ics'
  end

  private

  def issue_event(issue)
    Icalendar::Event.new.tap do |e|
      e.dtstart = icalendar_date(issue.start_date) if issue.start_date
      e.dtend = icalendar_date(issue.due_date) if issue.due_date
      e.summary = issue.subject
      e.url = issue_url(issue)
    end
  end

  def icalendar_date(date)
    Icalendar::Values::Date.new date
  end
end
