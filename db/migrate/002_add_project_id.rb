class AddProjectId < ActiveRecord::Migration
  def change
  	add_column :codes, :project_id, :integer    
  end
end