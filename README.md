Dev Fu! Base [![build status][ci-image]][ci] [![code quality][cq-image]][cq] [![test coverage][cc-image]][cc]
=============================================================================================================

A template for creating rails 3.2 applications.

## Prerequisites

- ruby 2.0.0
- bundler
- postgresql

### Environment Variables

In development & test, environment variables are loaded from `.env`

  - **EMAIL_HOST**: hostname to use in email links
  - **SECRET_TOKEN**: secret token for rails
  - **UNICORN_WORKERS**: number of unicorn workers to start

## Development

```bash
$ git clone git@github.com/devfu/base.git
$ cd base
$ bundle
$ cp {sample,}.env                  # edit this file
$ cp Procfile.local{.sample,}       # edit this file
$ cp config/database.yml{.sample,}  # edit this file
$ bundle exec rake db:setup
$ bundle exec rake spec
$ foreman start -f Procfile.local
```

## Testing

### Prerequisites

- phantomjs # brew install phantomjs

Tools used:

- rspec
- capybara
- factory girl
- poltergeist

```bash
rake spec # this will run all of the RSpec specifications, located in ./spec
```

- Specs are organized into model & feature specs (/spec/models, /spec/features)
- Factories are located in /spec/factories.rb

## Deploy

Recommended deployment is via [Heroku](http://heroku.com). They have an excellent intro at http://docs.heroku.com/quickstart

### Environment Variables

Use the heroku config command to check/set environemnt variables on Heroku.

## Contributors

- [BM5k](https://github.com/bm5k)
- [koedbymonkey](https://github.com/koedbymonkey)

Developed by [Dev Fu!, LLC](http://devfu.com)

<!-- links -->
[cc]: https://coveralls.io/r/devfu/base "test coverage"
[ci]: http://travis-ci.org/devfu/base "build status"
[cq]: https://codeclimate.com/github/devfu/base "code quality"

<!-- images -->
[cc-image]: https://coveralls.io/repos/devfu/base/badge.png
[ci-image]: https://secure.travis-ci.org/devfu/base.png
[cq-image]: https://codeclimate.com/github/devfu/base.png
