# Redmine Add to Calendar plugin

[![Build Status](http://img.shields.io/travis/hidakatsuya/redmine_add_to_calendar.svg?style=flat)](https://travis-ci.org/hidakatsuya/redmine_add_to_calendar)

Redmine plugin for adding issue to Calendar as event.

![Click "Add to Calendar" button in context menu of issues](http://art21.photozou.jp/pub/683/3135683/photo/213770488_org.v1415084013.png)

Click `Add to Calendar` button in context-menu of issues.

![issue_events.ics file will be downloaded](http://art21.photozou.jp/pub/683/3135683/photo/213770493_org.v1415084021.png)

`issue_events.ics` file will be downloaded.

## Planned Features (>= 0.0.3)

  * #5 Access control
    * Public project issues: All users with anonymous
    * Private project issues: Project member with `view_issues` permission
  * #4 Timezone by user preference
  * #3 User settings
    * Event time
    * Alarm rule

Please see Issues and Milestones for further details.

## Installation

`git clone` to `REDMINE/plugins`.

    $ git clone https://github.com/hidakatsuya/redmine_add_to_calendar.git REDMINE/plugins

Or, get this plugin from [here](https://github.com/hidakatsuya/redmine_add_to_calendar/releases).

Then, bundle install in Redmine directory:

    $ bundle install

Finally, restart Redmine.

## Uninstallation

Remove `REDMINE/plugins/redmine_add_to_calendar`, then restart Redmine.

## Supported versions

  * Redmine 3.1, 3.2, 3.3
  * Ruby 2.1, 2.2, 2.3

See [build result of TravisCI](https://travis-ci.org/hidakatsuya/redmine_add_to_calendar) for further details.

## Requirements

  * icalendar 2.0 or higher

## Copyright

&copy; Katsuya Hidaka. See MIT-LICENSE for further details.
