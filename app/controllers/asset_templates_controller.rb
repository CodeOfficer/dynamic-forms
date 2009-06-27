class AssetTemplatesController < ApplicationController

  def index
    @asset_templates = AssetTemplate.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /templates/1
  def show
    @asset_template = AssetTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def new
    @asset_template = AssetTemplate.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def edit
    @asset_template = AssetTemplate.find(params[:id])
  end
  
  def create
    @asset_template = AssetTemplate.new(params[:template])

    respond_to do |format|
      if @asset_template.save
        flash[:notice] = 'Template was successfully created.'
        format.html { redirect_to(@asset_template) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @asset_template = AssetTemplate.find(params[:id])

    respond_to do |format|
      if @asset_template.update_attributes(params[:template])
        flash[:notice] = 'Template was successfully updated.'
        format.html { redirect_to(@asset_template) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @asset_template = AssetTemplate.find(params[:id])
    @asset_template.destroy

    respond_to do |format|
      format.html { redirect_to(templates_url) }
    end
  end
end
