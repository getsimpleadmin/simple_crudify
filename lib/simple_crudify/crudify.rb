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
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

        def crud_actions(*actions)
          if actions.include?(:crud)
            DEPENDENCIES_MAP.values.each { |action| self.include(action) }
          else
            actions.each do |action|
              self.include(DEPENDENCIES_MAP[action])
            end
          end
        end
    end
  end
end
