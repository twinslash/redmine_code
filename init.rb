require 'redmine'
require 'redmine_code'

Redmine::Plugin.register :redmine_code do
  name 'Redmine Code plugin'
  author 'Maksim Yaroshevich'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  project_module :code do
    permission :manage_code, :codes => [:index, :new, :edit, :update, :create, :destroy]
  end  
end