# CSSE-490-lab-1

Lab 1: Photo Processing App

## Project Setup


### Cloning and Installing Dependencies

Make sure you have Ruby 3.1.4 or Ruby 3.2.x installed locally [on Windows using WSL](https://gorails.com/setup/windows/11) or [on Mac/Linux](https://www.ruby-lang.org/en/documentation/installation/). To push to Heroku, you'll also need to install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)).  If using Ruby 3.2.x, update the `.ruby-version` file to match your version of Ruby.

You will need `imagemagick` installed in order to do this lab. Instructions for installing ImageMagick can be found here: https://github.com/rmagick/rmagick  **Important:** If you are using WSL, you should be installing this in your Ubuntu VM, not on Windows itself.

```sh
$ git clone <repo url>
$ cd lab-1-<your_github_username>

$ bundle
```

### Running Tests

Run the full test suite with `rake` or `rake test`.

Run a single test with `spec spec/path/to_spec.rb:6`, replacing `spec/path/to_spec.rb` with the path to your actual test, and `6` with the actual line number of the test you are trying to run.

### Running Locally

```sh
$ rerun rackup
```

* `rerun` watches for filesystem changes and restarts your app as needed
* `rackup` runs rack applications (Sinatra is a rack application)

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
