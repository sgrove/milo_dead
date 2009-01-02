class TranslationsController < ApplicationController
  # HTTP requests using get and post will be processed normally, but AJAX requests will be rendered with no layout. 
  # This saves you from having to put render :layout => false every time you do an AJAX request.
  layout proc{ |c| c.request.xhr? ? false : "master" }
  
  # GET /translations
  # GET /translations.xml
  def index
    @translations = Translation.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @translations }
    end
  end
  
  def get_language_translations
    @language = Language.find(params[:language_id])
    @translations = Translation.find(:all, :conditions => {:language_id => params[:language_id]})
  end

  # GET /translations/1
  # GET /translations/1.xml
  def show
    @translation = Translation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @translation }
    end
  end

  # GET /translations/new
  # GET /translations/new.xml
  def new
    @translation = Translation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @translation }
    end
  end

  # GET /translations/1/edit
  def edit
    #@translation = Translation.find(params[:id])
    
    # TODO: implement language + phrase id checking to make sure they exist
    @phrase = Phrase.find(:first, :conditions => { :id => params[:phrase_id]})
    @language = Language.find(:first, :conditions => { :id => params[:language_id]})

    if @language.nil?
      @language = Language.find(:first, :conditions => { :id => 1})
    end
      
    @translation = Translation.find(:first, :conditions => { :phrase_id => @phrase.phrase , :language_id => @language.id})

    if @translation.nil?
      @translation = Translation.new
      @translation.phrase_id = @phrase.id
      @translation.language_id = @language.id
    end

    respond_to do |format|
      format.js
    end
  end

  # POST /translations
  # POST /translations.xml
  def create
    @translation = Translation.new(params[:translation])
    
    @phrase   = Phrase.find(:first, :conditions => { :id => @translation.phrase_id})
    @language = Language.find(:first, :conditions => { :id => @translation.language_id})
    
    if (@phrase.nil? or @language.nil?)
      #FAILS!
      quit
    end
      
    @translation = Translation.find(:first, :conditions => { :phrase_id => @phrase.id, :language_id => @language.id})

    if @translation.nil?
      @translation = Translation.new(params[:translation])
    end
    
    @translation.translation = params[:translation][:translation]
    
    respond_to do |format|
      if @translation.save
        flash[:notice] = 'Translation was successfully created.'
        format.html { redirect_to(@translation) }
        format.xml  { render :xml => @translation, :status => :created, :location => @translation }
        format.js   { render :layout => false }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /translations/1
  # PUT /translations/1.xml
  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        flash[:notice] = 'Translation was successfully updated.'
        format.html { redirect_to(@translation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.xml
  def destroy
    @translation = Translation.find(params[:id])
    @translation.destroy

    respond_to do |format|
      format.html { redirect_to(translations_url) }
      format.xml  { head :ok }
    end
  end
end
