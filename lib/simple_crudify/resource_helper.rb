module SimpleCrudify
  module ResourceHelper
    def resource(model_klass, resource_id)
      if defined?(FriendlyId)
        model_klass.friendly.find_by_friendly_id(resource_id)
      else
        model_klass.find(resource_id)
      end
    end

    module_function :resource
  end
end
