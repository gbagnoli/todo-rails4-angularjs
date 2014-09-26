# RoR-docker example app for rubyday2014

## Install docker

[The is best explained in the docker documentation](https://docs.docker.com/installation/#installation)

## How to build

run `./docker_build.sh` it will build both the `rubyday/ruby:2.1` and `rubyday/todo` images

## How to run

### Without fig

```bash
$ docker run -d --name postgres -t postgres:9.3
$ docker run --name todoapp --link postgres:db-1 --rm -t rubyday/todo bundle exec rake db:create
$ docker run --name todoapp --link postgres:db-1 --rm -t rubyday/todo bundle exec rake db:schema:load
$ docker run --name todoapp --link postgres:db-1 -d -t -p 3000:3000 rubyday/todo 
```

You can then access the application on [localhost:3000](http://localhost:3000)

`MacOSX` users: with boot2docker, you can reach the application using the ip address instead of
localhost.

```
$ boot2docker ip

The VM's Host only interface IP address is: 192.168.59.103
```

So you can read che app on http://192.168.59.103:3000 in this example.

### With FIG

```
# build the ruby21 image
$ docker build --rm -t rubyday/ruby:2.1 ruby21_docker_image/
$ fig build
$ fig up -d
$ fig run web bundle exec rake db:create
$ fig run web bundle exec rake db:schema:load
```

You can then access the application on [localhost:3000](http://localhost:3000)

# Showcase of Rails 4 and AngularJS integration

This is a todo list management application, written in Rails 4 and AngularJS. Tasks support CRUD operations as well as drag&drop sorting and setting due dates via a popup calendar. All task operations are done on the client side and synchronized to the server. The application sports a RESTful API used by AngularJS SPA and also usable standalone.

Check out the demo at [todo-rails4-angularjs](http://todo-rails4-angularjs.shellyapp.com/).

I wrote [an article that summarizes all the lessons learned during writing of this app](https://shellycloud.com/blog/2013/10/how-to-integrate-angularjs-with-rails-4). I also did a presentation about this integration at Ruby User Group in Sopot on September 18th. Check out [the slides](http://mkwiatkowski.github.io/angularjs-rails4-trug-presentation/).

## Technologies used

### Frontend

 - [Bootstrap 3.0.0](http://getbootstrap.com/)
 - [AngularJS 1.2.16](http://angularjs.org/)
 - [jQuery 1.10.2](http://jquery.com/)
 - [jQuery UI 1.10.3](http://jqueryui.com/)
 - [CoffeeScript 1.6.3](http://coffeescript.org/)
 - [Slim 2.0.1](http://slim-lang.com/)
 - [Sass 3.2.10](http://sass-lang.com/)
 - [Karma 0.10.2](http://karma-runner.github.io/)
 - [Jasmine 1.3.1](http://pivotal.github.io/jasmine/)
 - [editablespan](https://github.com/mkwidzinska/editablespan)
 - [ui-sortable](https://github.com/angular-ui/ui-sortable)

### Backend

 - [Ruby 2.0.0p247](http://www.ruby-lang.org/en/)
 - [Ruby on Rails 4.0.0](http://rubyonrails.org/)
 - [Devise 3.0.3](https://github.com/plataformatec/devise)
 - [active_model_serializers 0.8.1](https://github.com/rails-api/active_model_serializers)
 - [acts_as_list 0.3.0](https://github.com/swanandp/acts_as_list)
 - [Rspec 2.14](http://rspec.info/)
 - [factory_girl 4.2.0](https://github.com/thoughtbot/factory_girl)
