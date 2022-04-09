# README

### Getting Started

1. Install Ruby 3.1.1 (See [instructions here](https://www.ruby-lang.org/en/documentation/installation/#homebrew)) 
  * To verify Ruby is installed correctly, in your terminal type `ruby -v` and it should show something similar to   
    `(ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [x86_64-darwin21])`
3. Install bundler `gem install bundler` after Ruby is installed
   * To verify bundler is working correctly, in your terminal type `bundle --version` and it should show the version of bundle
5. Install Postgres (See [instructions here](https://www.postgresqltutorial.com/postgresql-getting-started/install-postgresql/))
6. Checkout this repository
7. In your preferred Terminal, go to the directory that you've checked out the repo and...
  * Type `bundle install`
8. Once bundle install succeeds - run `rails server`. This should get the server runnning in `http://localhost:3000`
