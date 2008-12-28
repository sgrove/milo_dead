class XliffController < ApplicationController
  
  def index
    @languages = Language.find(:all)
  end

  def download
    @language = Language.find(params[:id])
    @translations = @language.translations
  end

end
