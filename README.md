# Wagrant

The Wagrant is an Ubuntu/Xenial64 based development environment.

## What's installed

* Apache
* MySQL
* PHP 7
* Ruby 2.3
* Node.js 6.x

## Automated testing

Install serverspec and dependencies.

```shell
$ bundle install --path vendor/bundle
```

The run serverspec.

```shell
$ bundle exec rake spec
```

### Note

If you get an error like following.

```
Bundler could not find compatible versions for gem "bundler":
  In Gemfile:
    vagrant (= 1.8.5) was resolved to 1.8.5, which depends on
      bundler (= 1.12.5)
```

You should specify version to `bundle` command.

```
$ gem install bundler -v 1.12.5
$ bundle _1.12.5_ install
$ bundle _1.12.5_ exec rake spec
```
