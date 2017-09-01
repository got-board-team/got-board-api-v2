## Setup

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/967a4acb20974de092c903dd97484ccf)](https://www.codacy.com/app/lmansur/got-board-api-v2?utm_source=github.com&utm_medium=referral&utm_content=got-board-team/got-board-api-v2&utm_campaign=badger)

1. Clone the repository and change into it:

```
  git clone git@github.com:got-board-team/got-board-api-v2.git
  cd got-board-api-v2
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
