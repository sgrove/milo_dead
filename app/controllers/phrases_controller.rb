class PhrasesController < ApplicationController
  # GET /phrases
  # GET /phrases.xml
  def index
    @phrases = Phrase.find(:all, :order => 'LOWER(phrase) ASC')
    @phrase = Phrase.new()

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phrases }
    end
  end

  # GET /phrases/1
  # GET /phrases/1.xml
  def show
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phrase }
    end
  end

  # GET /phrases/new
  # GET /phrases/new.xml
  def new
    @phrase = Phrase.new
    @languages = Language.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phrase }
    end
  end

  # GET /phrases/1/edit
  def edit
    @phrase = Phrase.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /phrases
  # POST /phrases.xml
  def create
    @phrase = Phrase.new(params[:phrase])

    respond_to do |format|
      if @phrase.save
        @phrases = Phrase.find(:all, :order => 'LOWER(phrase) ASC')
        
        flash[:notice] = 'Phrase was successfully created.'
        
        #format.html { redirect_to(@phrase) }
        format.xml  { render :xml => @phrase, :status => :created, :location => @phrase }
        format.js   { render :layout => false }
        #format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phrase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phrases/1
  # PUT /phrases/1.xml
  def update
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      if @phrase.update_attributes(params[:phrase])
        flash[:notice] = 'Phrase was successfully updated.'
        format.html { redirect_to(@phrase) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phrase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /phrases/1/cancel_update.html
  def cancel_edit
    @phrase = Phrase.find(params[:id])
    
    respond_to do |format|
      format.js { render :action => "update" }
    end
  end
  
  # DELETE /phrases/1
  # DELETE /phrases/1.xml
  def destroy
    @phrase_id = params[:id]
    @phrase = Phrase.find(params[:id])
    @phrase.destroy

    respond_to do |format|  
      flash[:notice] = 'Phrase completely obliterated'
      format.js { render :layout => false}
      format.html { redirect_to(phrases_url) }
      format.xml  { head :ok }
    end
  end
end
