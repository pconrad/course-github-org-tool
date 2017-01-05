Course Github Org Tool
================

This tool is a first attempt at a MVP for allowing students to self-enroll in a GitHub Organization associated with a course, provided:

* Their school email address (e.g. 'cgaucho@umail.ucsb.edu') appears as a verified email address on their GitHub account
* That email is in the course roster for the course (uploaded by the instructor)

It also provides an interface for instructors to view which of their students have or have not enrolled in the GitHub Organization for the course, provided that the students have logged in to the application OR the application knows about the students' GitHub usernames.

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Ruby on Rails
-------------

This application requires:

- Ruby 2.3.0
- Rails 5.0.1
- PostgreSQL

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

To run this application in development, you need Postgres running locally, and a postgres user called `course-github-org-tool`.  Create it like this:

```
$ psql -d postgres
psql (9.4.5)
Type "help" for help.

defunkt=# create user "course-github-org-tool" with createdb;
CREATE ROLE
defunkt=# \q
```

Also, copy the file `.env.example` into a new file `.env` (set as ignored in the `.gitignore` file) and set the appropriate values.
* Values for github oauth from, for example <https://github.com/settings/applications/new>
  * The callback url will be `https://<<your-url>>/auth/github/callback`
* Create a utility machine account, and create a personal access token with the correct scope (user,admin:org) here: <https://github.com/settings/tokens>
  * NOTE: If you want to create a new account, but don't have a spare email address, you can use an email tag if you use a `sendmail` or Gmail account
  * For example, if your email is `foobar@gmail.com`, then a unique email could be `foobar+machine-account-test@gmail.com` and all emails to that address would be routed to your `foobar@gmail.com` mailbox.
  * For more information about this neat hack, check [this link](https://www.cs.rutgers.edu/~watrous/plus-signs-in-email-addresses.html) out.

This application utilizes the `dotenv-rails` gem, which automatically loads any variables specified in a file called `.env` in the project root into the environment when running the application.

Once you complete the above, run `bundle install`, `rails db:setup` and `rails db:migrate`, `rails serve`, etc. in the normal fashion.

Documentation and Support
-------------------------

TODO

Issues
-------------

TODO

Similar Projects
----------------

TODO

Contributing
------------

TODO

Credits
-------

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is supported by developers who purchase our RailsApps tutorials.

License
-------

TODO
