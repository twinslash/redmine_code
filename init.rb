require 'redmine'
require 'redmine_code/hooks'

Rails.configuration.to_prepare do
  unless ProjectsHelper.included_modules.include?(ProjectsHelperPatch)
    ProjectsHelper.send(:include, ProjectsHelperPatch)
  end
  unless Project.included_modules.include?(ProjectPatch)
    Project.send(:include, ProjectPatch)
  end
end

Redmine::Plugin.register :redmine_code do
  name 'Redmine Code plugin'
  author 'Maksim Yaroshevich'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  project_module :code do
    permission :manage_code, :codes => [:index, :new, :edit, :update, :create, :destroy]
  end  
end