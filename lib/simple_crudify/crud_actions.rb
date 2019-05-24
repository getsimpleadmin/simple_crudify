module SimpleCrudify
  module CrudActions
    # @since 1.0.0
    # @api private
    module Index
      def index
        @resources = model_klass.all

        render template_path
      end
    end

    # @since 1.0.0
    # @api private
    module Show
      def show
        @resource = ResourceHelper.resource(model_klass, params[:id])

        render template_path
      end
    end

    # @since 1.0.0
    # @api private
    module New
      def new
        @resource = model_klass.new

        render template_path
      end
    end

    # @since 1.0.0
    # @api private
    module Create
      def create
        @resource = model_klass.new(resource_params)

        if @resource.save
          redirect_to after_create_path, notice: controller_notice(action_name)
        else
          render template: template_path(:new)
        end
      end
    end

    # @since 1.0.0
    # @api private
    module Edit
      def edit
        @resource = ResourceHelper.resource(model_klass, params[:id])

        render template_path
      end
    end

    # @since 1.0.0
    # @api private
    module Update
      def update
        @resource = ResourceHelper.resource(model_klass, params[:id])

        if @resource.update(resource_params)
          redirect_to after_update_path, notice: controller_notice(action_name)
        else
          render template: template_path(:edit)
        end
      end
    end

    # @since 1.0.0
    # @api private
    module Destroy
      def destroy
        @resource = ResourceHelper.resource(model_klass, params[:id])
        @resource.destroy

        redirect_to after_destroy_path, notice: controller_notice(action_name)
      end
    end
  end
end
