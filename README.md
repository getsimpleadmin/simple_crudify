[![Build Status](https://secure.travis-ci.org/getsimpleadmin/simple_crudify.svg?branch=master)](http://travis-ci.org/getsimpleadmin/simple_crudify)[![codecov.io](https://codecov.io/github/getsimpleadmin/simple_crudify/coverage.svg?branch=master)](https://codecov.io/github/getsimpleadmin/simple_crudify?branch=master)[![Gem Version](https://badge.fury.io/rb/simple_crudify.svg)](https://rubygems.org/gems/simple_crudify)
# SimpleCrudify

The simple_crudify gem is a lightweight library for writing simple CRUD controllers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_crudify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_crudify

## Usage

A short example

```ruby
class UsersController < ApplicationController
  include SimpleCrudify::Crudify

  actions :crud

  def model_klass
    User
  end

  def controller_notice(_action_name)
    t("resource.#{action_name}.success", resource_name: model_klass.model_name.element.capitalize)
  end

  private

    def after_create_path
      edit_user_path(@resource)
    end

    def after_update_path
      users_path
    end

    def after_destroy_path
      users_path
    end

    def resource_params
      params.require(:user).permit(:password, :phone, :email)
    end
end
```

### Controller configuration

The first required configuration is an action name.

```ruby
actions :index, :show, :new, :create
actions :crud # an alias for all actions
```

Other settings

```ruby
def model_klass
  User
end
```

Allow specifying the model class.

```ruby
  def controller_notice(_action_name)
    t("resource.#{action_name}.success", resource_name: model_klass.model_name.element.capitalize)
  end
```

Helps to simplify controller redirect notice

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/getsimpleadmin/simple_crudify. This project is intended to be a safe, welcoming space for collaboration.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
