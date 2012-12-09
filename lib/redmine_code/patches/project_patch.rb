require_dependency 'project'

module RedmineCode
  module Patches
    module ProjectPatch
      def self.included(base) 
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.unloadable 
        base.has_many :codes
      end

      module ClassMethods    
      end

      module InstanceMethods
      end
    end
  end
end

Rails.configuration.to_prepare do
  unless Project.included_modules.include?(RedmineCode::Patches::ProjectPatch)
    Project.send(:include, RedmineCode::Patches::ProjectPatch)
  end
end