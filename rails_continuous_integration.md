# Setting up a CI Pipeline with Github Actions
We'll set up automated testing that is going to happen on Githubs servers. Maybe you know this: sometimes, when you add a feature you forget to test it yourself. Or you find out later that the code you added made some other part of your application buggy, that you didn't test, because it was somewhere else...
With this setup, everytime someone opens a pull request to merge to master, tests will be run on the Github servers.
### Why not run tests on my local machine?
If we run tests on the Github server with Docker containers, the environment will be the same **every single time** - some bugs are only visible for certain machines and not reproducable on another machine. Another benefit is, that it's impossible to forget running the tests.

# Setup first test
We need to actually add a test in our project to run it with github actions.
<br>

Let's add a system test, to mock a user action:
https://guides.rubyonrails.org/testing.html#system-testing
<br>

for example:
```
$ bin/rails generate system_test visit_homepage
```

go to the test file and add the following:
```
require "application_system_test_case"

class HomepagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    # change the 'h1' and text to what you want to test for on your homepage
    assert_selector "h1", text: "whatever text you have on your homepage"
  end
end
```

This would run perfectly fine on you machine, but since the Github server doesn't have a GUI it's only gonna accept headless chrome!
<br>

Now, let's change the application_system_test_case.rb file, located in the test folder to this:
```
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome
end
```

# Setup Githb actions
On your Repository page, click on Actions. Search for the Rails Action and add it.
<br>

Now there is a new file in your repository, under .github/workflows/rubyonrails.yml
<br>

**indentation is very important in yml files**
<br>

Change it to this:
```
# This workflow will install a prebuilt Ruby version, install dependencies, and run tests.
name: "Ruby on Rails CI"
on:
  # this runs on every push to master or pull request.
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]
jobs:
  # the test job that we're running.
  test:
    runs-on: ubuntu-latest
    services:
      # our database container that runs on linux alpine for speed.
      postgres:
        image: postgres:14.5-alpine3.16
        ports:
          - "5432:5432"
        env:
          POSTGRES_DB: rails_test
          POSTGRES_USER: rails
          POSTGRES_PASSWORD: password
    env:
      RAILS_ENV: test
      DATABASE_URL: "postgres://rails:password@localhost:5432/rails_test"
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      # Add or replace dependency steps here
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
          ruby-version: '3.1.2'
      # Add or replace database setup steps here
      - name: Set up database schema
        run: bin/rails db:schema:load
      # Add or replace test runners here
      # this runs all system tests, if you want to add other tests, just add a name and run step
      - name: Run system tests
        run: bin/rails test:system
      # other examples:
      # - name: Run Rake tests
      # run: bin/rake
      # - name: Run all tests
      # run: bin/rails test
```
<br>
