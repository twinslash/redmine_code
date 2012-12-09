require_dependency 'projects_helper'

module RedmineCode
  module Patches
    module ProjectsHelperPatch

      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable
            alias_method_chain :project_settings_tabs, :code
        end
      end

      module ClassMethods
      end

      module InstanceMethods

        def project_settings_tabs_with_code
          tabs = project_settings_tabs_without_code
          if @project.module_enabled?("code")
            call_hook(:helper_projects_settings_tabs, { :tabs => tabs })
          end
          return tabs
        end
      end
    end
  end
end

Rails.configuration.to_prepare do
  unless ProjectsHelper.included_modules.include?(RedmineCode::Patches::ProjectsHelperPatch)
    ProjectsHelper.send(:include, RedmineCode::Patches::ProjectsHelperPatch)
  end
end