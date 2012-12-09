module RedmineCode
  module Hooks
		class NewTabHook < Redmine::Hook::ViewListener

		  def helper_projects_settings_tabs(context = {})				    	
		      context[:tabs].push({ :name => 'code',
		                  :controller => :codes,
		                  :action => :index,
		                  :partial => 'codes/index',
		                  :label => :code })
		  end
		end
	end
end
