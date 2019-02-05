module SimpleCrudify
  module CommonMethods
    private

      def controller_notice(_action_name)
        raise NotImplementedError
      end

      def resource_params
        raise NotImplementedError
      end

      def template_path(controller_action=nil)
        "#{params[:controller]}/#{controller_action || params[:action]}"
      end
  end
end
