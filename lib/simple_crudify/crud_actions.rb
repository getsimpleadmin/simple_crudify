module SimpleCrudify
  module CrudActions
    module Index
      def index
        @resources = model_klass.all

        render template_path
      end
    end

    module Show
      def show
        if defined?(FriendlyId)
          @resource = model_klass.friendly.find(params[:id])
        else
          @resource = model_klass.find(params[:id])
        end

        render template_path
      end
    end

    module New
      def new
        @resource = model_klass.new

        render template_path
      end
    end

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

    module Edit
      def edit
        if defined?(FriendlyId)
          @resource = model_klass.friendly.find(params[:id])
        else
          @resource = model_klass.find(params[:id])
        end

        render template_path
      end
    end

    module Update
      def update
        if defined?(FriendlyId)
          @resource = model_klass.friendly.find(params[:id])
        else
          @resource = model_klass.find(params[:id])
        end

        if @resource.update(resource_params)
          redirect_to after_update_path, notice: controller_notice(action_name)
        else
          render template: template_path(:edit)
        end
      end
    end

    module Destroy
      def destroy
        if defined?(FriendlyId)
          @resource = model_klass.friendly.find(params[:id])
        else
          @resource = model_klass.find(params[:id])
        end

        @resource.destroy

        redirect_to after_destroy_path, notice: controller_notice(action_name)
      end
    end
  end
end
