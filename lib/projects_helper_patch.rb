require_dependency 'projects_helper'

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
        tabs.push({ :name => 'code',
                    :controller => :codes,
                    :action => :index,
                    :partial => 'codes/index',
                    :label => :code })
      end
      return tabs
    end
  end
end