module SimpleCrudify
  module CommonMethods
    private

      def resource_params
        raise NotImplementedError
      end

      def template_path(controller_action=nil)
        "#{params[:controller]}/#{controller_action || params[:action]}"
      end
  end
end
