class StaticController < ApplicationController
  def index
    redirect_to about_url
  end
  
  def about
    @tab = 0
    
    respond_to do |format|
      format.html {
        if request.xhr?
          render layout: false
        else
          render layout: true
        end
      }
      
      format.js
    end
  end
  
  def pic
    @tab = 2
    
    respond_to do |format|
      format.html {
        if request.xhr?
          render layout: false
        else
          render layout: true
        end
      }
      
      format.js
    end
  end
end
