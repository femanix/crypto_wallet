class WellcomeController < ApplicationController
  def index
    @nome =  params[:nome]
    
  end
end
