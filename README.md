# Really Simple Admin

Really Simple Admin is a starting block for apps that only need a backend for one admin to change some settings, but don't really need anything complicated. It uses the [sinatra](http://www.sinatrarb.com/) webframework, [mongodb](https://www.mongodb.org/) as a datastore and [JSONForm](https://github.com/joshfire/jsonform) for easy form creation.

## Prerequisites

* [Ruby](https://www.ruby-lang.org)
* [Mongodb](https://www.mongodb.org/)

## Installation

1. [Fork](https://github.com/mushishi78/really-simple-admin/fork)
2. Clone:

  ``` console
  $ cd /my-projects-folder
  $ git clone https://github.com/[insert-username]/really-simple-admin
  $ cd really-simple-admin
  ```

3. Install dependencies:

  ``` console
  $ bundle install
  ```

4. Set MongoDB URL environment variable:

  ``` console
  $ set MONGOLAB_URI='mongodb://127.0.0.1/really-simple-admin'
  ```

5. Run:

  ``` console
  $ bundle exec ruby app.rb
  ```

## Configuration

There are two configuration files that can be found in the `/config` folder.

### `form.yml`

This file is translated into JSON and used with [JSONForm](https://github.com/joshfire/jsonform) to define the form in the admin panel. Documentation can be found here: [JSONForm wiki](https://github.com/joshfire/jsonform/wiki#outline-of-a-json-form-object).

Here is an example:

``` yaml
schema:
  name:
    title: Name
    description: Nickname allowed
    type: string
  gender:
    title: Gender
    type: string
    enum:
      - Female
      - Male
      - Alien
form:
  - key: name
    fieldHtmlClass: input-xxlarge
  - gender
  - type: submit
    title: Update
```

This would define a schema as having a `name`, that can be any string, and a `gender` which can take on the values `Female`, `Male` or `Alien`. It will then create a form that will first have a wide `name` input, then a `gender` select box and then a `submit` button with labeled "Update".

### `default.yml`

This file is used to set the initial values for the configuration data. It should fullfil the schema as defined in `form.yml`.

Here is an example, that follows from the previous:

``` yaml
name: George Takei
gender: Male
```

## Deployment

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Really Simple Admin is a [sinatra](http://www.sinatrarb.com/) app, so instructions for deploying sinatra on your chosen platform should work.

As with development environment, it requires the environment variable `MONGOLAB_URI` to be set to the url of the mongodb database.

## Contributing

1. [Fork it](https://github.com/mushishi78/really-simple-admin/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
