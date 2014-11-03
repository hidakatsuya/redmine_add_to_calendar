class AddToCalendarController < ApplicationController
  unloadable

  def issues
    issues = Issue.where(id: params[:ids])
                  .where('start_date is not null or due_date is not null')

    return render nothing: true if issues.empty?

    calendar = Icalendar::Calendar.new
    calendar.publish

    issues.each do |issue|
      calendar.add_event(issue_event(issue))
    end

    send_data calendar.to_ical, type: :ics, filename: 'issue_events.ics'
  end

  private

  def issue_event(issue)
    event = Icalendar::Event.new

    event.dtstart = icalendar_date(issue.start_date) if issue.start_date
    event.dtend = icalendar_date(issue.due_date) if issue.due_date

    event.summary = issue.subject
    event.url = issue_url(issue)

    # event.alarm do |a|
    #   a.action = 'DISPLAY'
    #   a.summary = issue.subject
    #   a.trigger = '-P1D'
    # end

    event
  end

  def icalendar_date(date)
    Icalendar::Values::Date.new date
  end
end
