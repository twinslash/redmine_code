class CodesController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def index
    @codes = @project.codes
  end  

  def new
    @code = Code.new
  end

  def create    
    @code = Code.new(params[:code])
    @code.project = @project
    if @code.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          redirect_to :controller => 'projects', :action => 'settings', :tab => 'code', :id => @project
        end
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
      end 
    end
  end

  def edit
    @code = Code.find(params[:id])
  end  

  def update
    @code = Code.find(params[:id])
    @code.project = @project
    @code.attributes = params[:code]
    if @code.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_update)
          redirect_to :controller => 'projects', :action => 'settings', :tab => 'code', :id => @project
        end
      end
    else
      respond_to do |format|
        format.html { render :action => 'edit' }
      end 
    end     
  end

  def destroy
    @code = Code.find(params[:id])
    @code.destroy
    respond_to do |format|
      flash[:notice] = l(:notice_successful_delete)
      format.html { redirect_to :controller => 'projects', :action => 'settings', :id => @project, :tab => 'code' }
    end    
  end

  private

    def find_project
      @project = Project.find(params[:project_id])
    end  
end
