class Code < ActiveRecord::Base	
  unloadable

  belongs_to :project
  
  validates_presence_of :name, :gitlab_link
end
