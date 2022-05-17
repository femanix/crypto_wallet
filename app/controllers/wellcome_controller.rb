class WellcomeController < ApplicationController
  before_action :set_locale
  def index
    cookies[:curso] = "Ruby on Rails [COOKIE]"
    session[:curso] = "Ruby on Rails [SESSION]"
    @nome =  params[:nome]
    
  end

  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
    end

    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end

  end 

end