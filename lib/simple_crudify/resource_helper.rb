module SimpleCrudify
  # Module to easily handle additional gems that work with a model, like friendly_id
  #
  # @since 1.2.2
  #
  module ResourceHelper
    module_function

    def resource(model_klass, resource_id)
      if defined?(FriendlyId)
        model_klass.friendly.find_by_friendly_id(resource_id)
      else
        model_klass.find(resource_id)
      end
    end
  end
end
