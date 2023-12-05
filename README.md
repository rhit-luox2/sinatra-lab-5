# CSSE-490-lab-0

Lab 0: Deploying Our First Flask App

## Project Setup


### Cloning and Installing Dependencies

Make sure you have Ruby 3.1.4 or Ruby 3.2.x installed locally [on Windows using WSL](https://gorails.com/setup/windows/11) or [on Mac/Linux](https://www.ruby-lang.org/en/documentation/installation/). To push to Heroku, you'll also need to install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)).  If using Ruby 3.2.x, update the `.ruby-version` file to match your version of Ruby.

```sh
$ git clone <repo url>
$ cd lab-0-<your_github_username>

$ bundle
```

### Running Locally

```sh
$ ruby hello.rb
```

Your app should now be running on [localhost:9292](http://localhost:9292/).

## Deploying to Heroku

### Creating the Heroku application

```sh
$ heroku create
$ git push heroku main

$ heroku open
```

### Testing in a local Heroku environment

```sh
$ heroku local
```

### Pushing up new updates to the existing application

```sh
$ git push heroku main
```
