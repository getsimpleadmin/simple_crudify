module SimpleCrudify
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
