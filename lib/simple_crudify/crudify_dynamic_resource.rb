module SimpleCrudify
  module CrudifyDynamicResource
    def create
      @resource = model_klass.new(resource_params)
      @resource.save

      respond_to do |format|
        format.js { render layout: false }
      end
    end

    def update
      if defined?(FriendlyId)
        @resource = model_klass.friendly.find(params[:id])
      else
        @resource = model_klass.find(params[:id])
      end

      @resource.update(resource_params)

      respond_to do |format|
        format.js { render layout: false }
      end
    end

    def destroy
      if defined?(FriendlyId)
        @resource = model_klass.friendly.find(params[:id])
      else
        @resource = model_klass.find(params[:id])
      end

      @resource.destroy

      respond_to do |format|
        format.js { render layout: false }
      end
    end
  end
end
