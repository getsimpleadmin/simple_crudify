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

  crud_actions :crud

  def model_klass
    User
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
crud_actions :index, :show, :new, :create
crud_actions :crud # an alias for all actions
```

Other settings

```ruby
def model_klass
  User
end
```

Allow specifying the model class.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/getsimpleadmin/simple_crudify. This project is intended to be a safe, welcoming space for collaboration.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
