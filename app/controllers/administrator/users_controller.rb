class Administrator::UsersController < ApplicationController
  before_action :admin_user
  
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name" , 
              template: "administrator/users/index.html.haml",
              layout: 'application',
              encording: 'UTF-8'
      end
    end
  end

  def show
    
  end
  
  private
    def admin_user
      redirect_to(root_url) unless current_user.administrator?
    end
end
