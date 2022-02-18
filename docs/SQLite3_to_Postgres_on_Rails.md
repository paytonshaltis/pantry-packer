# SQLite3 to Postgres on Rails

Right now, you probably have this as your `config/database.yml`

```yaml
# SQLite. Versions 3.8.0 and up are supported.
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3

```

We want to move to postgres.

### Setup

Make sure you've at some point run these commands. If you don't, `bundle install` will fail. 

`sudo yum install postgresql-devel postgresql-libs`

`bundle add pg`

`bundle install`

Note: Do **not** run `bundle` commands as root (`sudo`). Bundle will instruct you to run a command as `sudo ` if you have to. For more information, read the bundle documentation about [root access](https://bundler.io/man/bundle-install.1.html#SUDO-USAGE)

### The changes

We need to make some changes to the `default` block. Go ahead and replace it with this one instead.

```yaml
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: 127.0.0.1
  username: postgres
  timeout: 5000
  encoding: unicode
  template: template0
```

Yes, the template part is really weird. I've learned not to question it.

The other blocks now need to have some name changes. Right now, the `name` field has all kinds of randomness in it. That has to change.

Lets change

```yaml
database: db/<some_name>.sqlite3
```

to this. Remove `db/`. remove `.sqlite3`. Add the app name in front of the existing database name so weird conflicts don't happen down the road.

```yaml
database: <your_app_name>_<some_name>
```

Do this for every one of these fields.

### The switchover

Your database is now hooked to postgres, meaning your existing databases are gone. You'll need to run `rails db:setup` again before the server will work.



Happy coding!



You can return to the installation guide [here](Installation_Guide.md#setting-up-the-correct-database).
