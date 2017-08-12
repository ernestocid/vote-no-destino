# README

Link for the project hosted on Heroku: [http://vote-no-destino-2.herokuapp.com/](http://vote-no-destino-2.herokuapp.com/).
Survey options can be managed by accessing the /options url.

## Setup
### Dependencies

* Ruby 2.3.1
* Rails 5.0.5
* Postgres

### Basics

Just run:

```
  bundle install
```

### Database Initialisation

Create a .env file and fill up the information needed there. You can copy from the sample .env provided

```
  cp .env.sample .env
```

After you fill up the information run:

```
  rails db:create
  rails db:migrate
  rails db:seed
```

### Testing

The project uses rspec for testing so just run:

```
  rspec
```
