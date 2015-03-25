class StaticController < ApplicationController
  def index
    redirect_to about_url
  end
  
  def about
    @tab = 0
    @mobile = mobile?
    
    respond_to do |format|
      format.html {
        if request.xhr?
          response.headers["Cache-Control"] = "no-cache no-store"
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
    @mobile = mobile?
    
    respond_to do |format|
      format.html {
        if request.xhr?
          response.headers["Cache-Control"] = "no-cache"
          render layout: false
        else
          render layout: true
        end
      }
      
      format.js
    end
  end
end
