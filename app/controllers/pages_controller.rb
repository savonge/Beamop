class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy, :publish]

  before_filter :authenticate_user!, only: [:publish]
  # GET /pages
  # GET /pages.json






  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
    @page_bg = @page.bg_style || @page.backgroundimage
    @page_h1 = @page.headline_style || @page.h1_style
    @custom_image = "style=\"background-image: url('#{@page.picture.url}')\"" if @page.picture.present?

  end

  def publish

    @page.update_attributes(page_params)

    @user = current_user
    @page_h1 = params[:h1_style]
    @page_bg = params[:bg_style]
    @page.headline_style = params[:h1_style]
    @page.bg_style = params[:bg_style]
    @page.user = @user
    @page.set_url
    @page.imgurl = findimage

    @page.save!

    # redirect_to public_path(genurl: @page.url)

    redirect_to @page
  end

  def findimage

    if @page.picture.present?
      @page.picture.url
    else
      view_context.image_path("#{@page.bg_style}.jpg")
    end

  end

  def select_bg_style
    if @page.picture.present?
    @custom_image
    else
    params[:bg_style]
    end

  end





  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def show_public_page
      @page = Page.find_by(url: params[:genurl])
      @page_bg = @page.bg_style
      @page_h1 = @page.headline_style
      @custom_image = "style=\"background-image: url('#{@page.imgurl}')\""
      render :publish
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:url, :headline, :content, :picture, :btn)
    end


end
