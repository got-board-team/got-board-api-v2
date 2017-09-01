## Setup

1. Clone the repository:

```
  git clone git@github.com:got-board-team/got-board-api-v2.git
```

2. Install Ruby 2.4.1 and bundler gem

3. Install all gems
```
bundle install
```

4. Copy the example environment file and set the relevant values

```
  cp .env.example .env
```

5. Install Docker

6.  With `Docker` installed, run:

```
  docker-compose up
```

This will download, install, configure and run all external dependencies

7. Setup the database

```
  rails db:setup
```

8. Voilá
