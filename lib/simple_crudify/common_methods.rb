module SimpleCrudify
  # Common methods that should implement in each controller
  #
  # @since 1.0.0
  #
  # @example
  #
  # class UsersController < ApplicationController
  #   include SimpleCrudify::Crudify
  #
  #   actions :crud
  #
  #   def model_klass
  #     User
  #   end
  #
  #   # Notice for a user after redirect action
  #
  #   def controller_notice(action_name)
  #     t("resource.#{action_name}.success", resource_name: model_klass)
  #   end
  #
  #   private
  #
  #     def after_create_path
  #       edit_user_path(@resource)
  #     end
  #
  #     def after_update_path
  #       users_path
  #     end
  #
  #     def after_destroy_path
  #       users_path
  #     end
  #
  #     def resource_params
  #       params.require(:user).permit(:password, :phone, :email)
  #     end
  # end
  #
  module CommonMethods
    private

    def controller_notice(*_args)
      raise NotImplementedError, 'You should use a unified interface, add #controller_notice method'
    end

    def resource_params
      raise NotImplementedError, 'You should use a unified interface, add #resource_params method'
    end

    def template_path(controller_action=nil)
      "#{params[:controller]}/#{controller_action || params[:action]}"
    end
  end
end
