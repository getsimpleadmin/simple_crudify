module SimpleCrudify
  # @since 1.0.0
  # @api private
  module CrudifyDynamicResource
    def create
      @resource = model_klass.new(resource_params)
      @resource.save

      respond_to do |format|
        format.js { render layout: false }
      end
    end

    def update
      @resource = ResourceHelper.resource(model_klass, params[:id])
      @resource.update(resource_params)

      respond_to do |format|
        format.js { render layout: false }
      end
    end

    def destroy
      @resource = ResourceHelper.resource(model_klass, params[:id])
      @resource.destroy

      respond_to do |format|
        format.js { render layout: false }
      end
    end
  end
end
