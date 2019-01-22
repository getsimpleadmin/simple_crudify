module SimpleCrudify
  module Crudify
    include CommonMethods

    DEPENDENCIES_MAP = {
      index:   CrudActions::Index,
      show:    CrudActions::Show,
      new:     CrudActions::New,
      create:  CrudActions::Create,
      edit:    CrudActions::Edit,
      update:  CrudActions::Update,
      destroy: CrudActions::Destroy
    }.freeze

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

        def actions(*action_names)
          if action_names.include?(:crud)
            DEPENDENCIES_MAP.values.each { |action| include(action) }
          else
            action_names.each do |action|
              include(DEPENDENCIES_MAP[action])
            end
          end
        end
    end
  end
end
