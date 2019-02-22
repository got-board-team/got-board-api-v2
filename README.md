[![Build Status](https://travis-ci.org/got-board-team/got-board-api-v2.svg?branch=master)](https://travis-ci.org/got-board-team/got-board-api-v2)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/967a4acb20974de092c903dd97484ccf)](https://www.codacy.com/app/lmansur/got-board-api-v2?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=got-board-team/got-board-api-v2&amp;utm_campaign=Badge_Grade)
## New Features
To suggest a new feature, simply create an issue detailing what you want us to add. Be as detailed as possible, explaining why you think we should add the feature. If the feature is gameplay related, point us to the rule section where this feature is explained.

You can also implement the feature yourself! Just create an issue beforehand so we can discuss it.
## Setup

1. Clone the repository and change into it:

```
  git clone git@github.com:got-board-team/got-board-api-v2.git
  cd got-board-api-v2
```

2. Install Ruby 2.6.1 and the `bundler` gem

3. Install all gems
```
bundle install
```

4. Copy the example environment file and set the relevant values

```
  cp .env.example .env
```

5. Install Docker

6.  With Docker installed, run:

```
  docker-compose up
```

This will download, install, configure and run all external dependencies

7. Setup the database

```
  rails db:setup
```

8. Voilá

## Deployment

To deploy the application to Heroku, make sure everything is committed and pushed to the desired branch. Ideally you want to push the `master` branch to the `heroku` remote. To do so, run:

```
git push heroku master
```

If for some reason you want to push a non-master branch to heroku, such as `other_branch`, use:

```
git push heroku other_branch:master
```

Remember to run any pending migrations afterwards.

## Connecting to the server instance

If you don't have the Heroku CLI installed, check the [official instructions](https://devcenter.heroku.com/articles/heroku-cli)

To open a rails console in the production environment:

```
heroku run console
```

To run migrations:
```
heroku run rails db:migrate
```

For other commands, just follow the structure `heroku run YOUR COMMAND HERE`. More examples below:

```
heroku run bash
```

```
heroku run rails db:rollback
```
