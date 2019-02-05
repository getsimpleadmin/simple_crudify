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
        @resource = model_klass.find(params[:id])

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
        @resource = model_klass.find(params[:id])

        render template_path
      end
    end

    module Update
      def update
        @resource = model_klass.find(params[:id])

        if @resource.update(resource_params)
          redirect_to after_update_path, notice: controller_notice(action_name)
        else
          render template: template_path(:edit)
        end
      end
    end

    module Destroy
      def destroy
        @resource = model_klass.find(params[:id])
        @resource.destroy

        redirect_to after_destroy_path, notice: controller_notice(action_name)
      end
    end
  end
end
