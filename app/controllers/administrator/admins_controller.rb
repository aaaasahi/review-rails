class Administrator::AdminsController < ApplicationController
  
  def index
    @users = User.all
    @articles = Article.all 
  end
  
end
