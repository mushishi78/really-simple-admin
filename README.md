# Really Simple Admin

Really Simple Admin is a starting block for apps that only need a backend for one admin to change some settings, but don't really need anything complicated. It uses the [sinatra](http://www.sinatrarb.com/) webframework, [mongodb](https://www.mongodb.org/) as a datastore and [JSONForm](https://github.com/ulion/jsonform) for easy form creation.

The backend is protected using HTTP Basic authentication with a single username and password. To edit settings, the admin is presented a form that is defined with [yaml config files](#configuration). This form updates a single mongodb document, to be used in the application for any means.

To see it in action, trying logging into the demo: **[Demo](https://really-simple-admin.herokuapp.com/)**

## Prerequisites

* [Ruby](https://www.ruby-lang.org)
* [Mongodb](https://www.mongodb.org/)

## Installation

1. [Fork](https://github.com/mushishi78/really-simple-admin/fork)
2. Clone:

  ``` console
  $ cd /my-projects-folder
  $ git clone https://github.com/[insert-username]/really-simple-admin my-app
  $ cd my-app
  ```

3. Install dependencies:

  ``` console
  $ bundle install
  ```

4. Set MongoDB URL environment variable:

  ``` console
  $ set MONGOLAB_URI='mongodb://127.0.0.1/my-app'
  ```

5. Run:

  ``` console
  $ bundle exec ruby app.rb
  ```

## Configuration

There are three configuration files that can be found in the `/config` folder. These files are translated into JSON and used with [JSONForm](https://github.com/ulion/jsonform) to define the form in the admin panel. Refer to [JSONForm wiki](https://github.com/joshfire/jsonform/wiki#outline-of-a-json-form-object) for documentation and [JSONForm Playground](http://ulion.github.io/jsonform/playground/) for examples.

### `schema.yml`

This file describes the expected shape and types for the data. As with JSONForm, it uses the [JSON-Schema](http://json-schema.org/) format to describe the data, with the exception that the outermost node is [assumed to be an object](https://github.com/joshfire/jsonform/wiki#hey-thats-not-pure-json-schema).

``` yaml
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
```

This would define a schema as having a `name`, that can be any string, and a `gender` which can take on the values `Female`, `Male` or `Alien`.

### `form.yml`

This file lists the order and presentation of the fields in the admin form and used as the [form argument for JSONForm](https://github.com/joshfire/jsonform/wiki#controlling-the-layout-of-the-form).

``` yaml
- key: name
  fieldHtmlClass: input-xxlarge
- gender
- type: submit
  title: Update
```

This defines a form that will first have a wide `name` input, then a `gender` select box and then a `submit` button labeled "Update".

### `seed.yml`

This file is used to set the initial values for the data. It should fullfil the schema as defined in `schema.yml`.

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
