class StaticController < ApplicationController
  def index
    redirect_to about_url format: :html
  end

  def about
  end
  
  def pic
  end

  def countdown
  end
end
